package com.example.macros.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.macros.model.entity.ComidaHistorialEntity;

@Repository
public interface ComidaHistorialRepository extends JpaRepository<ComidaHistorialEntity, Long>{
    List<ComidaHistorialEntity> findByUserId(Long userId);  
}
