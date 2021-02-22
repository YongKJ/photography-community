package com.web.graduation.dao;

import com.web.graduation.entities.ArtCollection;
import com.web.graduation.entities.Article;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@Mapper
public interface ArticleDao {
//  添加博文
    int addArticle(Article article);
    List<Article> articleList(int user_id,String info);
    int addGlance(int article_id);
    int addColl(int article_id);
    int reduceColl(int article_id);
    Article selectArticle(int article_id);
    List<Article> allArticles();
    List<Article> searchArticles(String info);
    List<Article> hotArticles();
    int isCollect(int user_id, int art_id,String date_time);
    int delCollect(int user_id, int art_id);
    ArtCollection artCollList(int user_id, int art_id);
    List<Article> userCollList(int user_id);
    int delArticle(int user_id, int art_id);

}
