PRAGMA foreign_keys = ON;

CREATE TABLE product_reviews 
( 
    product_review_id INTEGER 

  
 
        CONSTRAINT product_reviews_pk 
        PRIMARY KEY AUTOINCREMENT, 
 
    shopper_id INTEGER 
        CONSTRAINT product_reviews_shopper_id_nn 
        NOT NULL, 
 
    product_id INTEGER 
        CONSTRAINT product_reviews_product_id_nn 
        NOT NULL, 
 
    review_rating INTEGER 
        CONSTRAINT product_reviews_rating_nn 
        NOT NULL, 
 
    review_comment TEXT 
        CONSTRAINT product_reviews_comment_nn 
        NOT NULL, 
 
    review_submitted_date_time TEXT 
        CONSTRAINT product_reviews_date_time_nn 
        NOT NULL 
        DEFAULT CURRENT_TIMESTAMP, 
 
    CONSTRAINT product_reviews_submission_unique 
        UNIQUE 
        ( 
            shopper_id, 
            product_id, 
            review_submitted_date_time 
        ), 
 
    CONSTRAINT product_reviews_shoppers_fk 
        FOREIGN KEY (shopper_id) 
        REFERENCES shoppers (shopper_id) 
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION, 
 
    CONSTRAINT product_reviews_products_fk 
        FOREIGN KEY (product_id) 
        REFERENCES products (product_id) 
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION, 
 
    CONSTRAINT product_reviews_rating_check 
        CHECK 
( 
    typeof(review_rating) = 'integer' 
    AND review_rating BETWEEN 1 AND 5 
), 
 
    CONSTRAINT product_reviews_comment_check 
        CHECK 

  
 
        ( 
            length(trim(review_comment)) BETWEEN 1 AND 500 
        ), 
 
    CONSTRAINT product_reviews_date_time_check 
        CHECK 
        ( 
            length(review_submitted_date_time) = 19 
 
            AND review_submitted_date_time GLOB 
            '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9]' 
 
            AND datetime(review_submitted_date_time) IS NOT NULL 
 
            AND CAST( 
                substr(review_submitted_date_time, 1, 4) 
                AS INTEGER 
            ) BETWEEN 1 AND 9999 
 
            AND CAST( 
                substr(review_submitted_date_time, 6, 2) 
                AS INTEGER 
            ) BETWEEN 1 AND 12 
 
            AND CAST( 
                substr(review_submitted_date_time, 9, 2) 
                AS INTEGER 
            ) BETWEEN 1 AND 
                CASE 
                    WHEN CAST( 
                        substr(review_submitted_date_time, 6, 2) 
                        AS INTEGER 
                    ) IN (4, 6, 9, 11) 
                        THEN 30 
 
                    WHEN CAST( 
                        substr(review_submitted_date_time, 6, 2) 
                        AS INTEGER 
                    ) = 2 
                        THEN 
                            CASE 
                                WHEN 
                                    CAST( 
                                        substr( 
                                            review_submitted_date_time, 
                                            1, 
                                            4 
                                        ) AS INTEGER 
                                    ) % 400 = 0 
                                    OR 
                                    ( 
                                        CAST( 
                                            substr( 

  
 
                                                review_submitted_date_time, 
                                                1, 
                                                4 
                                            ) AS INTEGER 
                                        ) % 4 = 0 
                                        AND 
                                        CAST( 
                                            substr( 
                                                review_submitted_date_time, 
                                                1, 
                                                4 
                                            ) AS INTEGER 
                                        ) % 100 <> 0 
                                    ) 
                                    THEN 29 
                                ELSE 28 
                            END 
                    ELSE 31 
                END 
 
            AND CAST( 
                substr(review_submitted_date_time, 12, 2) 
                AS INTEGER 
            ) BETWEEN 0 AND 23 
 
            AND CAST( 
                substr(review_submitted_date_time, 15, 2) 
                AS INTEGER 
            ) BETWEEN 0 AND 59 
 
            AND CAST( 
                substr(review_submitted_date_time, 18, 2) 
                AS INTEGER 
            ) BETWEEN 0 AND 59 
        ) 
);

CREATE TABLE seller_reviews 
( 
    seller_review_id INTEGER 
        CONSTRAINT seller_reviews_pk 
        PRIMARY KEY AUTOINCREMENT, 
 
    shopper_id INTEGER 
        CONSTRAINT seller_reviews_shopper_id_nn 
        NOT NULL, 
 
    seller_id INTEGER 
        CONSTRAINT seller_reviews_seller_id_nn 
        NOT NULL, 

  
 
 
    review_rating INTEGER 
        CONSTRAINT seller_reviews_rating_nn 
        NOT NULL, 
 
    review_comment TEXT 
        CONSTRAINT seller_reviews_comment_nn 
        NOT NULL, 
 
    review_submitted_date_time TEXT 
        CONSTRAINT seller_reviews_date_time_nn 
        NOT NULL 
        DEFAULT CURRENT_TIMESTAMP, 
 
    CONSTRAINT seller_reviews_submission_unique 
        UNIQUE 
        ( 
            shopper_id, 
            seller_id, 
            review_submitted_date_time 
        ), 
 
    CONSTRAINT seller_reviews_shoppers_fk 
        FOREIGN KEY (shopper_id) 
        REFERENCES shoppers (shopper_id) 
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION, 
 
    CONSTRAINT seller_reviews_sellers_fk 
        FOREIGN KEY (seller_id) 
        REFERENCES sellers (seller_id) 
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION, 
 
    CONSTRAINT seller_reviews_rating_check 
        CHECK 
( 
    typeof(review_rating) = 'integer' 
    AND review_rating BETWEEN 1 AND 5 
), 
 
    CONSTRAINT seller_reviews_comment_check 
        CHECK 
        ( 
            length(trim(review_comment)) BETWEEN 1 AND 500 
        ), 
 
    CONSTRAINT seller_reviews_date_time_check 
        CHECK 
        ( 
            length(review_submitted_date_time) = 19 
 
            AND review_submitted_date_time GLOB 

  
 
            '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9]' 
 
            AND datetime(review_submitted_date_time) IS NOT NULL 
 
            AND CAST( 
                substr(review_submitted_date_time, 1, 4) 
                AS INTEGER 
            ) BETWEEN 1 AND 9999 
 
            AND CAST( 
                substr(review_submitted_date_time, 6, 2) 
                AS INTEGER 
            ) BETWEEN 1 AND 12 
 
            AND CAST( 
                substr(review_submitted_date_time, 9, 2) 
                AS INTEGER 
            ) BETWEEN 1 AND 
                CASE 
                    WHEN CAST( 
                        substr(review_submitted_date_time, 6, 2) 
                        AS INTEGER 
                    ) IN (4, 6, 9, 11) 
                        THEN 30 
 
                    WHEN CAST( 
                        substr(review_submitted_date_time, 6, 2) 
                        AS INTEGER 
                    ) = 2 
                        THEN 
                            CASE 
                                WHEN 
                                    CAST( 
                                        substr( 
                                            review_submitted_date_time, 
                                            1, 
                                            4 
                                        ) AS INTEGER 
                                    ) % 400 = 0 
                                    OR 
                                    ( 
                                        CAST( 
                                            substr( 
                                                review_submitted_date_time, 
                                                1, 
                                                4 
                                            ) AS INTEGER 
                                        ) % 4 = 0 
                                        AND 
                                        CAST( 
                                            substr( 
                                                review_submitted_date_time, 
                                                1, 

  
 
                                                4 
                                            ) AS INTEGER 
                                        ) % 100 <> 0 
                                    ) 
                                    THEN 29 
                                ELSE 28 
                            END 
                    ELSE 31 
                END 
 
            AND CAST( 
                substr(review_submitted_date_time, 12, 2) 
                AS INTEGER 
            ) BETWEEN 0 AND 23 
 
            AND CAST( 
                substr(review_submitted_date_time, 15, 2) 
                AS INTEGER 
            ) BETWEEN 0 AND 59 
 
            AND CAST( 
                substr(review_submitted_date_time, 18, 2) 
                AS INTEGER 
            ) BETWEEN 0 AND 59 
        ) 
);