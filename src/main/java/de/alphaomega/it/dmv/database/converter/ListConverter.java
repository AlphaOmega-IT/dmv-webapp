package de.alphaomega.it.dmv.database.converter;

import jakarta.persistence.AttributeConverter;

import java.util.List;

public class ListConverter implements AttributeConverter<List<String>, String> {
    
    @Override
    public String convertToDatabaseColumn(final List<String> permissions) {
        return String.join(";", permissions);
    }
    
    @Override
    public List<String> convertToEntityAttribute(final String permissionsAsString) {
        return List.of(permissionsAsString.split(";"));
    }
}