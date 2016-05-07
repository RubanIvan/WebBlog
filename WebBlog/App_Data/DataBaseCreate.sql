--������� ������ ����������������
CREATE TABLE blog.Lang(
		LangID			int IDENTITY NOT NULL PRIMARY KEY,	--�������������
		LangText		nvarchar(512),						--�������� �����
);

INSERT blog.Lang(LangText) VALUES
('C#'),('HTML'),('JavaScript'),('CSS'),('Less'),('TypeScript');


--������� ����������
--DROP TABLE blog.Technology
CREATE TABLE blog.Technology (
		TechID			int IDENTITY NOT NULL PRIMARY KEY,	--�������������
		ParentTechID	int,								--������ �� �������� ��� �������� ���������
		TechText		nvarchar(512),						--�������� ����������
 );

 INSERT blog.Technology (TechText,ParentTechID) VALUES
 ('Web',0),('ASP MVC',0),('Unity 3d',0),('ComonLib',0),('Console',0),('WPF',0),('WinForms',0);
 
 INSERT blog.Technology (TechText,ParentTechID) VALUES
 ('ASP MVC 4.5 (MVC 5)',2),('ASP Core (MVC 6)',2),('Unity 3d v5',3);
 
  SELECT * FROM blog.Technology;

  -- ������� �������� ��� ����
  --DROP TABLE blog.Post;
  CREATE TABLE blog.Post(
			PostID			int IDENTITY NOT NULL PRIMARY KEY,	--�������������
			LangID			int,								--������ �� ����
			TechID			int,								--������ �� ����������
			CreateTime		SmallDateTime NOT NULL,				--����� ����������
			Topic			nvarchar(1024) NOT NULL,			--���������
			RawPost			nvarchar(MAX) NOT NULL,				--���������� ��������
			
  )

ALTER TABLE blog.Post WITH CHECK ADD  CONSTRAINT [FK_LangID_Lang] FOREIGN KEY (LangID)
REFERENCES blog.Lang(LangID)

ALTER TABLE blog.Post WITH CHECK ADD  CONSTRAINT [FK_TechID_Technology] FOREIGN KEY (TechID)
REFERENCES blog.Technology(TechID)

-- ������� �������� ������ �����
CREATE TABLE blog.Tag(
		TagID			int IDENTITY NOT NULL PRIMARY KEY,	--�������������  ����
		TagName			nvarchar(512) NOT NULL ,			--���
)

-- ������� ��������� ������ �� ������
CREATE TABLE blog.PostTag(
		PostTagID			int IDENTITY NOT NULL PRIMARY KEY,	--�������������  ����
		PostID				int NOT NULL,
		TagID				int NOT NULL
)

ALTER TABLE blog.PostTag WITH CHECK ADD  CONSTRAINT [FK_PostID_Post] FOREIGN KEY (PostID)
REFERENCES blog.Post(PostID)

ALTER TABLE blog.PostTag WITH CHECK ADD  CONSTRAINT [FK_TagID_Tag] FOREIGN KEY (TagID)
REFERENCES blog.Tag(TagID)