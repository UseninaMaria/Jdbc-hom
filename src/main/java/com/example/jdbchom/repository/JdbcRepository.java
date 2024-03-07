package com.example.jdbchom.repository;


import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.stream.Collectors;
@Component
public class JdbcRepository {
    private final NamedParameterJdbcTemplate namedParamJdbcTemplate;
    private final String scriptName = "getProductName.sql";
    private final String requestLine = read(scriptName);

    public JdbcRepository(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParamJdbcTemplate = namedParameterJdbcTemplate;
    }

    private static String read(String scriptName) {
        try (InputStream is = new ClassPathResource(scriptName).getInputStream();
             BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is))) {
            return bufferedReader.lines().collect(Collectors.joining("\n"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public List<String> getProductName(String name) {
        MapSqlParameterSource parameters = new MapSqlParameterSource("name", name);
        return namedParamJdbcTemplate.queryForList(requestLine, parameters, String.class);
    }
}
