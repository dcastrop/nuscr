module type Name_S = sig
  type t [@@deriving show {with_path= false}, sexp_of]

  val equal : t -> t -> bool

  val of_string : string -> t

  val rename : t -> string -> t

  val user : t -> string

  val where : t -> Loc.source_loc

  val create : string -> Loc.source_loc -> t

  val compare : t -> t -> int
end

(* Name_M is used for all identifiers in the concrete syntax tree,
 * for names in the abstract syntax tree, use the tagged names in the Names
 * module *)
module Name_M : Name_S