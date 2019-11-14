PGDMP     (                
    w            bacsilog    12.0    12.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16397    bacsilog    DATABASE     �   CREATE DATABASE "bacsilog" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "bacsilog";
                postgres    false            �            1259    16408    franchise_fee    TABLE     �   CREATE TABLE "public"."franchise_fee" (
    "fran_fee_amount" integer NOT NULL,
    "fran_fee_receipt" integer NOT NULL,
    "fran_id" integer NOT NULL,
    "id" integer NOT NULL
);
 %   DROP TABLE "public"."franchise_fee";
       public         heap    postgres    false            �            1259    16434    franchise_fee_fran_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."franchise_fee_fran_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "public"."franchise_fee_fran_id_seq";
       public          postgres    false    204                        0    0    franchise_fee_fran_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE "public"."franchise_fee_fran_id_seq" OWNED BY "public"."franchise_fee"."fran_id";
          public          postgres    false    205            �            1259    16446    franchise_fee_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."franchise_fee_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE "public"."franchise_fee_id_seq";
       public          postgres    false    204            !           0    0    franchise_fee_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE "public"."franchise_fee_id_seq" OWNED BY "public"."franchise_fee"."id";
          public          postgres    false    206            �            1259    16400 
   franchisee    TABLE     �  CREATE TABLE "public"."franchisee" (
    "id" integer NOT NULL,
    "fran_fname" character varying(20) NOT NULL,
    "fran_lname" character varying(20) NOT NULL,
    "fran_birthdate" "date" NOT NULL,
    "fran_address" character varying(20) NOT NULL,
    "fran_salary" integer NOT NULL,
    "fran_email" character varying(20) NOT NULL,
    "fran_num" integer,
    "fran_id" integer NOT NULL
);
 "   DROP TABLE "public"."franchisee";
       public         heap    postgres    false            �            1259    16462    franchisee_fran_fee    VIEW     j  CREATE VIEW "public"."franchisee_fran_fee" AS
 SELECT "franchisee"."id",
    "franchisee"."fran_fname",
    "franchisee"."fran_lname",
    "franchisee"."fran_salary",
    "franchise_fee"."fran_id",
    "franchise_fee"."fran_fee_amount"
   FROM ("public"."franchisee"
     JOIN "public"."franchise_fee" ON (("franchisee"."fran_id" = "franchise_fee"."fran_id")));
 *   DROP VIEW "public"."franchisee_fran_fee";
       public          postgres    false    203    203    203    203    203    204    204            �            1259    16455    franchisee_fran_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."franchisee_fran_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE "public"."franchisee_fran_id_seq";
       public          postgres    false    203            "           0    0    franchisee_fran_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE "public"."franchisee_fran_id_seq" OWNED BY "public"."franchisee"."fran_id";
          public          postgres    false    207            �            1259    16398    franchisee_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."franchisee_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE "public"."franchisee_id_seq";
       public          postgres    false    203            #           0    0    franchisee_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE "public"."franchisee_id_seq" OWNED BY "public"."franchisee"."id";
          public          postgres    false    202            �
           2604    16436    franchise_fee fran_id    DEFAULT     �   ALTER TABLE ONLY "public"."franchise_fee" ALTER COLUMN "fran_id" SET DEFAULT "nextval"('"public"."franchise_fee_fran_id_seq"'::"regclass");
 J   ALTER TABLE "public"."franchise_fee" ALTER COLUMN "fran_id" DROP DEFAULT;
       public          postgres    false    205    204            �
           2604    16448    franchise_fee id    DEFAULT     �   ALTER TABLE ONLY "public"."franchise_fee" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."franchise_fee_id_seq"'::"regclass");
 E   ALTER TABLE "public"."franchise_fee" ALTER COLUMN "id" DROP DEFAULT;
       public          postgres    false    206    204            �
           2604    16403    franchisee id    DEFAULT     |   ALTER TABLE ONLY "public"."franchisee" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."franchisee_id_seq"'::"regclass");
 B   ALTER TABLE "public"."franchisee" ALTER COLUMN "id" DROP DEFAULT;
       public          postgres    false    203    202    203            �
           2604    16457    franchisee fran_id    DEFAULT     �   ALTER TABLE ONLY "public"."franchisee" ALTER COLUMN "fran_id" SET DEFAULT "nextval"('"public"."franchisee_fran_id_seq"'::"regclass");
 G   ALTER TABLE "public"."franchisee" ALTER COLUMN "fran_id" DROP DEFAULT;
       public          postgres    false    207    203                      0    16408    franchise_fee 
   TABLE DATA                 public          postgres    false    204   w                 0    16400 
   franchisee 
   TABLE DATA                 public          postgres    false    203   �       $           0    0    franchise_fee_fran_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"public"."franchise_fee_fran_id_seq"', 1, false);
          public          postgres    false    205            %           0    0    franchise_fee_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('"public"."franchise_fee_id_seq"', 1, false);
          public          postgres    false    206            &           0    0    franchisee_fran_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('"public"."franchisee_fran_id_seq"', 2, true);
          public          postgres    false    207            '           0    0    franchisee_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('"public"."franchisee_id_seq"', 1, true);
          public          postgres    false    202            �
           2606    16450     franchise_fee franchise_fee_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "public"."franchise_fee"
    ADD CONSTRAINT "franchise_fee_pkey" PRIMARY KEY ("id");
 P   ALTER TABLE ONLY "public"."franchise_fee" DROP CONSTRAINT "franchise_fee_pkey";
       public            postgres    false    204            �
           2606    16405    franchisee franchisee_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY "public"."franchisee"
    ADD CONSTRAINT "franchisee_pkey" PRIMARY KEY ("id");
 J   ALTER TABLE ONLY "public"."franchisee" DROP CONSTRAINT "franchisee_pkey";
       public            postgres    false    203               t   x���v
Q���WP*(M��LV�SJ+J�K��,N�OKMUR� �����y%J:
�������Xf
�	$5�}B]�4��@G��H���5�'}l6��l���6sq �eHi         �   x�Տ�j�0��y
�K[H��m���B�!�ecM=5v�h��8!��g�Σ�0_��@��|��. ˋO`���Pɖ��-k2J1�3�,�[v�Z��S�@'��Zb�����2Ƴ��ɣ�H��v��o7.`���6[��,m�4��P�+"Ix��Gxƞ`M��y����^2��v,ˋ��D���k��i������,"��gG_hp�5^ݍ5iz4�����A�����     