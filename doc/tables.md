![Image of Database Schema](/doc/DBSchema.png)

Продукты
--------

products
________
Продукты. Косметические продукты.

```
  CREATE TABLE products
  (
  id INTEGER NOT NULL DEFAULT nextval('products_id_seq'::regclass),
  name CHARACTER VARYING,
  title CHARACTER VARYING,
  description TEXT,
  skin_type INTEGER,
  sku CHARACTER VARYING,
  price NUMERIC,
  primary_concern_id INTEGER,
  category_id INTEGER,
  PRIMARY KEY (id)
  );

  ALTER TABLE products ADD CONSTRAINT fk_rails_447b8f19c5 FOREIGN KEY (primary_concern_id) REFERENCES primary_concerns (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

  ALTER TABLE products ADD CONSTRAINT fk_rails_fb915499a4 FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
```
- name - внутренее имя
- title - название для покупателя (на языке по-умолчанию)
- description - описание для покупателя (на языке по-умолчанию)
- skin_type - код типа кожи
- sku - внутренний идентификатор для инвенторизации
- price - цена
- primary_concern_id - ключ primary_concerns, косметическа проблема, что этот продукт решает
- category_id - ключ categories, категория продукта

product_translations
____________________

```
  CREATE TABLE product_translations
  (
  id INTEGER NOT NULL DEFAULT nextval('product_translations_id_seq'::regclass),
  title CHARACTER VARYING,
  description TEXT,
  language INTEGER,
  product_id INTEGER,
  PRIMARY KEY (id)
  );

  ALTER TABLE product_translations ADD CONSTRAINT fk_rails_f53f501ab3 FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
```
Переводы полей продуктов на разные языки
- title - перевод названия продукта для покупателя
- description - перевод описания продукта для покупателя
- language - код языка
- product_id - ключ products, продукт

related_product_relations
_________________________
```
  CREATE TABLE related_product_relations
  (
  id INTEGER NOT NULL DEFAULT nextval('related_product_relations_id_seq'::regclass),
  product_id INTEGER,
  related_product_id INTEGER,
  PRIMARY KEY (id)
  );

  ALTER TABLE related_product_relations ADD CONSTRAINT fk_rails_6ed3547ede FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

  ALTER TABLE related_product_relations ADD CONSTRAINT fk_rails_da161d74b7 FOREIGN KEY (related_product_id) REFERENCES products (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
```
Связанные продукты. Просматривая определенный продукт, пользователь также увидит рекомандации продуктов, описанных в этой таблице
- product_id - ключ products, основной продукт
- related_product_id - ключ product, связанный продукт

product_markets
_______________
```
  CREATE TABLE product_markets
  (
  id INTEGER NOT NULL DEFAULT nextval('product_markets_id_seq'::regclass),
  product_id INTEGER,
  market_id INTEGER,
  PRIMARY KEY (id)
  );

  ALTER TABLE product_markets ADD CONSTRAINT fk_rails_122de973a5 FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

  ALTER TABLE product_markets ADD CONSTRAINT fk_rails_620ded3d2b FOREIGN KEY (market_id) REFERENCES markets (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
```
Рынки, на которых доступны продкты

Категории
---------

categories
__________
```
  CREATE TABLE categories
  (
  id INTEGER NOT NULL DEFAULT nextval('categories_id_seq'::regclass),
  name CHARACTER VARYING,
  description TEXT,
  PRIMARY KEY (id)
  );

```
Категории продуктов (например "мужские", "женские")
- name - название категории
- description - описание категории

Проблемы
--------

primary_concerns
________________
```
  CREATE TABLE primary_concerns
  (
  id INTEGER NOT NULL DEFAULT nextval('primary_concerns_id_seq'::regclass),
  name CHARACTER VARYING,
  description TEXT,
  PRIMARY KEY (id)
  );
```
Косметические проблемы, что решают продукты
- name - имя
- description - описание

Рынки
-----

markets
_______
```
  CREATE TABLE markets
  (
  id INTEGER NOT NULL DEFAULT nextval('markets_id_seq'::regclass),
  code CHARACTER VARYING,
  name CHARACTER VARYING,
  PRIMARY KEY (id)
  );
```
Рынки - страны, регионы, территориальные единицы.
- code - код рынка
- name - имя рынка

Профили
-------

profiles
________
```
  CREATE TABLE profiles
  (
  id INTEGER NOT NULL DEFAULT nextval('profiles_id_seq'::regclass),
  name CHARACTER VARYING,
  description TEXT,
  welcome_button1 INTEGER,
  welcome_button2 INTEGER,
  welcome_button3 INTEGER,
  PRIMARY KEY (id)
  );
```

Профиль - это группа устройств с общими настройками
- name - название профиля
- description - описание профиля
- welcome_button_* - ключи кнопок, что будут показываться на главной странице приложения, запущенного на устройства (например "мужской каталог", "женский катало")

profile_markets
_______________
```
  CREATE TABLE profile_markets
  (
  id INTEGER NOT NULL DEFAULT nextval('profile_markets_id_seq'::regclass),
  market_id INTEGER,
  profile_id INTEGER,
  PRIMARY KEY (id)
  );

  ALTER TABLE profile_markets ADD CONSTRAINT fk_rails_9337547560 FOREIGN KEY (market_id) REFERENCES markets (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

  ALTER TABLE profile_markets ADD CONSTRAINT fk_rails_469a959833 FOREIGN KEY (profile_id) REFERENCES profiles (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
```
Рынки, на которых доступны устройства профиля

Устройства
----------
devices
_______
```
  CREATE TABLE devices
  (
  id INTEGER NOT NULL DEFAULT nextval('devices_id_seq'::regclass),
  name CHARACTER VARYING,
  device_type INTEGER,
  lifecycle INTEGER,
  email_enabled BOOLEAN,
  printer_enabled BOOLEAN,
  profile_id INTEGER,
  PRIMARY KEY (id)
  );

  ALTER TABLE devices ADD CONSTRAINT fk_rails_f8614277ca FOREIGN KEY (profile_id) REFERENCES profiles (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
```

Устройства. Физические устройства, планшеты, на которых запущено приложение для покупателей.
На нем они могут посмотреть каталог товаров, считать штрих-код товара, заказать товар. Также им пользуются консультанты в магазинах для помощи покупателям.
- name - название устройства
- device_type - код типа устройства (Kiosk, Киоск - для посетителей магазинов; Consultant, Консультант - для консультантов в магазинах)
- lifecycle - код состояния устройства (Inventory, Инвентарь - в склад; InService, установлено и активно; Decomissioned, Списано)
- email_enabled - подключен ли email на устройстве
- printer_enabled - подключен ли принтер для устройства
- profile_id - ключ profiles, профиль устройства
