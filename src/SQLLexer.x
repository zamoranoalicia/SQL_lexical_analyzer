--
-- Lexical syntax for SQL
--
-- Alicia Zamorano 2017
{
module SQLLexer (scanTokens) where
}


%wrapper "basic"

$alpha                   = [a-zA-Z]
$whitechar               = [ \t\n\r\f\v]
$latin_upper_case_letter = [A-Z]
$latin_lower_case_letter = [a-z]
$digit                   = 0-9
$double_quote            = "
$percent                 = \%
$ampersand               = \&
$quote                   = \'
$left_paren              = \(
$right_paren             = \)
$asterisk                = \*
$plus_sign               = \+
$comma                   = \,
$minus_sign              = \-
$period                  = \.
$solidus                 = \/
$colon                   = \:
$semi_colon              = \;
$less_than_operator      = \<
$equals_operator         = \=
$greater_than_operator   = \>
$greater_than_operator   = \>
$question_mark           = \?
$left_bracket            = \[
$right_bracket           = \]
$circunflex              = \^
$vertical_bar            = \|
$left_brace              = \{
$right_brace             = \}

@sql_special_characters = $double_quote
                        | $percent
                        | $ampersand
                        | $quote
                        | $left_paren
                        | $right_paren
                        | $asterisk
                        | $plus_sign
                        | $comma
                        | $minus_sign
                        | $period
                        | $solidus
                        | $colon
                        | $semi_colon
                        | $less_than_operator
                        | $equals_operator
                        | $greater_than_operator
                        | $question_mark
                        | $left_bracket
                        | $right_bracket
                        | $circunflex
                        | $vertical_bar
                        | $left_brace
                        | $right_brace
sql :-
--white space insensitive
  $white+               ;
  --Comments
  "--".*                ;
  create                        {\s -> TokenCreate}
  delete                        {\s -> TokenDelete}
  $alpha                        {\s -> Var s}
  $digit+                       {\s -> Int (read s)}
  <0> @sql_special_characters   {\s -> TokenSQLSpecialCharacters}

{
data Token
  = TokenCreate
  | TokenDelete
  | TokenFrom
  | TokenInsert
  | TokenSelect
  | TokenUpdate
  | TokenWhereClause
  | TokenSQLSpecialCharacters
  | Var String
  | Int Int
  deriving (Eq)

--main = do
--   s <- getContents
--   print (alexScanTokens s)
--
scanTokens :: String -> [Token]
scanTokens = alexScanTokens
}