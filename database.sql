PGDMP         8        	        {            postgres    15.1    15.1     	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    5    postgres    DATABASE     ?   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1251';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3340                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false                       0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            ?            1259    16439    Administrators    TABLE     ?   CREATE TABLE public."Administrators" (
    login text NOT NULL,
    password text NOT NULL,
    "firstName" text NOT NULL,
    "secondName" text NOT NULL
);
 $   DROP TABLE public."Administrators";
       public         heap    postgres    false            ?            1259    16432 	   Customers    TABLE     ?   CREATE TABLE public."Customers" (
    login text NOT NULL,
    password text NOT NULL,
    first_name text NOT NULL,
    second_name text NOT NULL,
    balance double precision NOT NULL
);
    DROP TABLE public."Customers";
       public         heap    postgres    false            ?            1259    24616 	   ItemsList    TABLE       CREATE TABLE public."ItemsList" (
    id integer NOT NULL,
    category text NOT NULL,
    subcategory text NOT NULL,
    brand text NOT NULL,
    model text NOT NULL,
    price double precision NOT NULL,
    general_category text NOT NULL,
    belongs_to text
);
    DROP TABLE public."ItemsList";
       public         heap    postgres    false            ?            1259    24615    ItemsList_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."ItemsList_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."ItemsList_id_seq";
       public          postgres    false    218                       0    0    ItemsList_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."ItemsList_id_seq" OWNED BY public."ItemsList".id;
          public          postgres    false    217            n           2604    24619    ItemsList id    DEFAULT     p   ALTER TABLE ONLY public."ItemsList" ALTER COLUMN id SET DEFAULT nextval('public."ItemsList_id_seq"'::regclass);
 =   ALTER TABLE public."ItemsList" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218                      0    16439    Administrators 
   TABLE DATA           V   COPY public."Administrators" (login, password, "firstName", "secondName") FROM stdin;
    public          postgres    false    216   
                 0    16432 	   Customers 
   TABLE DATA           X   COPY public."Customers" (login, password, first_name, second_name, balance) FROM stdin;
    public          postgres    false    215   m                 0    24616 	   ItemsList 
   TABLE DATA           s   COPY public."ItemsList" (id, category, subcategory, brand, model, price, general_category, belongs_to) FROM stdin;
    public          postgres    false    218   j                  0    0    ItemsList_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."ItemsList_id_seq"', 155, true);
          public          postgres    false    217            r           2606    16445 "   Administrators Administrators_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Administrators"
    ADD CONSTRAINT "Administrators_pkey" PRIMARY KEY (login);
 P   ALTER TABLE ONLY public."Administrators" DROP CONSTRAINT "Administrators_pkey";
       public            postgres    false    216            t           2606    24623    ItemsList ItemsList_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."ItemsList"
    ADD CONSTRAINT "ItemsList_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."ItemsList" DROP CONSTRAINT "ItemsList_pkey";
       public            postgres    false    218            p           2606    16438    Customers Sellers_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Customers"
    ADD CONSTRAINT "Sellers_pkey" PRIMARY KEY (login);
 D   ALTER TABLE ONLY public."Customers" DROP CONSTRAINT "Sellers_pkey";
       public            postgres    false    215               S   x?KL???3?,H,.6??M?.????,K??/?JI???8?2?K??8]?2S??? ??`IcN?Լ?b??????"??=... R4J         ?   x?e??n?0?g?a??lqt??CS??;v?!6?X?3??+?E?r??????'F?`?4?x??1X,]?Ѫ?1\?B?? ?Kx]?n?'???D?fQ?D`?+???i_"???Y?FgN=?x~\?%^?E?r?y??U+|?Y??k??.QN]???1G?-?cd??ƺR?g????-?>?܎??e??z??dＥ藻L?S?Cc???d??>}????Ε? ???R??t]?         7  x????r?*ǯ?S?NGp???Ng??3??Lo??:Lm?c)Mӧ/???9???Ď?,?e????????~:TG?:????-"?I)_Ii????͍:t͡E_?.?p??#"???#l1WO??????E0A?	L?`???o???{??????Ǖ?-? ?E,(#?"?q,XĂ?	~?uz??
?3(?GY<???? ??!??"?z?V??;?,վ}??h?v????0?	$z-??u?W?m?Y???L??[??p?UH/?&[??j?G?^?V?WM?=??#?$7_c?Qj?7U??hЗf??+Is?
?$E1؂?{u솷'??_??f+?:L????&???m?h?ѝ??<?u????Xit??MFa??y????f?w????????'?3?1??:??O??6?6?q??c?1D)???%2~:??li? -?n?????^?jjtK?????z{?_?쪺U??~;??e???=%<?٤?ޙ??.W?	_Q?w????????R?^??M???1W{]o3?-?;<????]ҟ??$???r'??e?f:c???4??]o??d?V??????P{????p?+i4*hj>$#??4?z?P?j?Z????f8/P)}?A&
?,R2?] </{???uAēP????Y???f>?Qv.&*
sH?"?u?䬟????΅?G?????T?????C??\z=-_d?"???Q??Z?QH??Q;
i}`a?<??##5?T\ĮhM?????=???Zz??^c	1?J_r???!?R???E??[Y???????C????Ӳ?d	??$?????OjƊ4?b??tj^$h??i???}6?$?sG??9$?eu?U??%?W?Ӈ??!*?C?C?XH@;p???q?x?r???v??=sd??A??9Av??W'?wl_? ????W'?+; Hl?G?ȱ??!?}n}M??rC??&7N?rc??.???x?????&??_?`?&O?x??@?>?@xT???QTu?
 ?8lLFxԘ?Qv?F??Ő???hG?@{????k<??P;~???8@?8
??хJ????????????o?PC?     