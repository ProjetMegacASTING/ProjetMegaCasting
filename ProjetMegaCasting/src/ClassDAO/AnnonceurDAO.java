/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ClassDAO;

import Class.Annonceur;
import Class.Domaine;
import Class.Information;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author
 * Alexis
 */
public class AnnonceurDAO {
    
    public static void CreerAnnonceur(Connection cnx, Annonceur ann) throws Exception{
            Annonceur a = TrouverAnnonceurNom(cnx, ann.getNom_annonceur());
        if(a != null){
            throw new Exception(ann.getNom_annonceur() + " existe déjà !");
        }
        
        InformationDAO.CreerInformation(cnx, ann.getInformation());
        
        Statement stmt = null;
        
        try {
            stmt = cnx.createStatement();
            stmt.executeUpdate("INSERT INTO annonceur (nom_annonceur, id_information, id_domaine) "
                    + "VALUES ('" + ann.getNom_annonceur() + "'"                 
                    + ", " + ann.getInformation().getId_information()
                    + ", " + ann.getDomaine().getId_domaine()
                    + ")");
            ResultSet rs = stmt.executeQuery("SELECT MAX(id_annonceur) FROM annonceur");
            if (rs.next()){
                long id = rs.getLong(1);
                ann.setId_anonceur((int) id);
            }
        } catch (Exception ex) {
         ex.printStackTrace();
        } finally {
            if(stmt != null){
                try {
                    stmt.close();
                } catch (SQLException ex) {
                }
            }
        }
                 
           
    }
    
    public static void ModifierAnnonceur(Connection cnx, Annonceur ann) throws SQLException{
         
        Statement stmt = null;
        
         try {
             stmt =  cnx.createStatement();
             stmt.executeUpdate("UPDATE annonceur"
                    + " SET nom_annonceur ='" + ann.getNom_annonceur());
         } catch (SQLException ex) {
             ex.printStackTrace();
         }finally{
             if (stmt != null){
                 stmt.close();
             }
         }
    }
    
    static  public void SupprimerAnnonceur(Connection cnx, Annonceur ann) throws SQLException{
         Statement stmt = null;
        
         try {
             stmt =  cnx.createStatement();
             stmt.executeUpdate("DELETE FROM annonceur"
                    + " WHERE id =" +ann.getId_anonceur() + ";");
         } catch (SQLException ex) {
             ex.printStackTrace();
         }finally {
            if(stmt != null){
                try {
                    stmt.close();
                } catch (SQLException ex) {
                }
            }
        }
    }
    
    
     public static ArrayList<Annonceur> ListerAnonceur(Connection cnx){
        ArrayList<Annonceur> liste = new ArrayList<>(); 
        Statement stmt = null;
        
         try {
             stmt =  cnx.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT id_annonceur, nom_annonceur, id_information, id_domaine"
                    + " FROM anonceur;");
            
           while(rs.next()){
               long id_annonceur = rs.getInt(1);
               String nom_annonceur = rs.getString(2);                 
               long id_information = rs.getInt(3);
               long id_domaine = rs.getInt(4);
               
               Information inf = InformationDAO.TrouverInformationId(cnx, id_information);
               Domaine dom = DomaineDAO.TrouverDomaineId(cnx, id_domaine);
               
               Annonceur ann = new Annonceur(nom_annonceur, inf, dom);         
               ann.setId_anonceur(id_annonceur);
               
               liste.add(ann);
               
               
               
           }
         } catch (Exception e) {
             e.printStackTrace();
         }finally {
            
            if(stmt != null){
                try {
                    stmt.close();
                } catch (SQLException ex) {
                }
            }
            
            if(cnx != null){
                try {
                    cnx.close();
                } catch (SQLException ex) {
                }
            }
        }
        return null;
     
       
    }

    public static Annonceur TrouverAnnonceurId(Connection cnx, long id_annonceur) {
        Annonceur ann = null;
        Statement stmt = null;
        
        try {
            
            stmt =  cnx.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT id_annonceur, nom_annonceur, id_information, id_domaine"
                    + " FROM annonceur"
                   + " WHERE id_annonceur ='" + id_annonceur + "';");
            
         if (rs.next()){
             
               long id_information = rs.getLong(3);                           
               String nom_annonceur = rs.getString(2);
               long id_domaine = rs.getInt(4);
                
               
               Information inf = InformationDAO.TrouverInformationId(cnx, id_information);
               Domaine dom = DomaineDAO.TrouverDomaineId(cnx, id_domaine);
               
               ann = new Annonceur(nom_annonceur, inf, dom);
               ann.setId_anonceur(id_annonceur);
               }
            
         
              
        } catch (Exception e) {
            
        }finally {
            if(stmt != null){
                try {
                    stmt.close();
                } catch (SQLException ex) {
                }
            }
        }
         
        return ann;
             
           }
    public static Annonceur TrouverAnnonceurNom(Connection cnx, String nom_annonceur) {
        Annonceur ann = null;
        Statement stmt = null;
        
        try {
            
            stmt =  cnx.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT id_annonceur, nom_annonceur, id_information, id_domaine"
                    + " FROM annonceur"
                   + " WHERE nom_annonceur ='" + nom_annonceur + "';");
            
         if (rs.next()){
               
               long id_annonceur = rs.getLong(1);
               long id_information = rs.getLong(3);                            
               long id_domaine = rs.getInt(4);
                
               
               Information inf = InformationDAO.TrouverInformationId(cnx, id_information);
               Domaine dom = DomaineDAO.TrouverDomaineId(cnx, id_domaine);
               
               ann = new Annonceur(nom_annonceur, inf, dom);
               ann.setId_anonceur(id_annonceur);
               }
            
         
              
        } catch (Exception e) {
            
        }finally {
            if(stmt != null){
                try {
                    stmt.close();
                } catch (SQLException ex) {
                }
            }
        }
         
        return ann;
             
           }
    

    }

