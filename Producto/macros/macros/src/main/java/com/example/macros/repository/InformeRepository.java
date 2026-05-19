package com.example.macros.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.macros.model.Informe;   

@Repository
public interface InformeRepository extends JpaRepository<Informe, String> {
}