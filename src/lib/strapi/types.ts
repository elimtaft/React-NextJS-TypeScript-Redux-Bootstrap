export interface ArticleCategory {
  id: number;
  title: string;
  slug: string;
  published_at: string;
  created_at: string;
  updated_at: string;
}

export interface ArticleData {
  id: string;
  title: string;
  content: string;
  slug: string;
  description: string;
  thumbnail: string;
  post_category: ArticleCategory;
  published_at: string;
  created_at: string;
  updated_at: string;
}

export interface ArticleArray {
  data: ArticleData[];
}

export interface PageData {
  id: string;
  title: string;
  content: string;
  slug: string;
  published_at: string;
  created_at: string;
  updated_at: string;
}
