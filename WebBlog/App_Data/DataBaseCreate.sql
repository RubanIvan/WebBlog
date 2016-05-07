--Таблица языков программирования
CREATE TABLE blog.Lang(
		LangID			int IDENTITY NOT NULL PRIMARY KEY,	--идентификатор
		LangText		nvarchar(512),						--название языка
);

INSERT blog.Lang(LangText) VALUES
('C#'),('HTML'),('JavaScript'),('CSS'),('Less'),('TypeScript');


--Таблица технологий
--DROP TABLE blog.Technology
CREATE TABLE blog.Technology (
		TechID			int IDENTITY NOT NULL PRIMARY KEY,	--идентификатор
		ParentTechID	int,								--ссылка на родителя для указании подверсии
		TechText		nvarchar(512),						--название технологии
 );

 INSERT blog.Technology (TechText,ParentTechID) VALUES
 ('Web',0),('ASP MVC',0),('Unity 3d',0),('ComonLib',0),('Console',0),('WPF',0),('WinForms',0);
 
 INSERT blog.Technology (TechText,ParentTechID) VALUES
 ('ASP MVC 4.5 (MVC 5)',2),('ASP Core (MVC 6)',2),('Unity 3d v5',3);
 
  SELECT * FROM blog.Technology;

  -- таблица содержит сам пост
  --DROP TABLE blog.Post;
  CREATE TABLE blog.Post(
			PostID			int IDENTITY NOT NULL PRIMARY KEY,	--идентификатор
			LangID			int,								--ссылка на язык
			TechID			int,								--ссылка на технологию
			CreateTime		SmallDateTime NOT NULL,				--Время добавления
			Topic			nvarchar(1024) NOT NULL,			--Заголовок
			RawPost			nvarchar(MAX) NOT NULL,				--содержимое страницы
			
  )

ALTER TABLE blog.Post WITH CHECK ADD  CONSTRAINT [FK_LangID_Lang] FOREIGN KEY (LangID)
REFERENCES blog.Lang(LangID)

ALTER TABLE blog.Post WITH CHECK ADD  CONSTRAINT [FK_TechID_Technology] FOREIGN KEY (TechID)
REFERENCES blog.Technology(TechID)

-- таблица содержит список тэгов
CREATE TABLE blog.Tag(
		TagID			int IDENTITY NOT NULL PRIMARY KEY,	--идентификатор  Тэга
		TagName			nvarchar(512) NOT NULL ,			--Тэг
)

-- таблица отношения многих ко многим
CREATE TABLE blog.PostTag(
		PostTagID			int IDENTITY NOT NULL PRIMARY KEY,	--идентификатор  Тэга
		PostID				int NOT NULL,
		TagID				int NOT NULL
)

ALTER TABLE blog.PostTag WITH CHECK ADD  CONSTRAINT [FK_PostID_Post] FOREIGN KEY (PostID)
REFERENCES blog.Post(PostID)

ALTER TABLE blog.PostTag WITH CHECK ADD  CONSTRAINT [FK_TagID_Tag] FOREIGN KEY (TagID)
REFERENCES blog.Tag(TagID)