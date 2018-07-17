package com.example.inSky.controller;

import com.example.inSky.domain.Message;
import com.example.inSky.domain.Role;
import com.example.inSky.domain.User;
import com.example.inSky.repos.MessageRepo;
import com.example.inSky.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.Array;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/message")
public class MessageController {

    @Value("${upload.path}")
    private String storageDirectory;

    @Autowired
    private MessageRepo messageRepo;

    @GetMapping("/{id}/delete")
    public String deleteFile(@PathVariable("id") Integer id) throws IOException {

        Optional<Message> byId = messageRepo.findById(id);

        Path filePath = Paths.get(storageDirectory, "/", byId.get().getFilename());
        if (Files.exists(filePath)) {
            Files.delete(filePath);
            messageRepo.deleteById(id);
        }

        return "redirect:/main";
    }

    @RequestMapping(path = "/{id}/download", method = RequestMethod.GET)
    public ResponseEntity<Resource> download(@PathVariable Integer id, HttpServletRequest request) throws IOException {

        Optional<Message> byId = messageRepo.findById(id);

        Path filePath = Paths.get(storageDirectory, "/", byId.get().getFilename());

        File file = filePath.toFile();

        if (!Files.exists(filePath)) {
            throw new FileNotFoundException();
        }

        String contentType = null;
        contentType = request.getServletContext().getMimeType(file.getAbsolutePath());

        contentType = contentType == null ? "application/octet-stream" : contentType;

        InputStreamResource resource = new InputStreamResource(new FileInputStream(filePath.toFile()));
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Disposition", "attachment;filename=" + byId.get().getFilename());

        return ResponseEntity.ok()
                .headers(headers)
                .contentLength(file.length())
                .contentType(MediaType.parseMediaType(contentType))
                .body(resource);
    }
}
