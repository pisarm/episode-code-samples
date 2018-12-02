/*:
 # The Many Faces of Map Exercises

 1. Implement a `map` function on dictionary values, i.e.

    ```
    map: ((V) -> W) -> ([K: V]) -> [K: W]
    ```

    Does it satisfy `map(id) == id`?

 */
func map<K, V, W>(_ f: @escaping (V) -> W) -> ([K: V]) -> [K: W] {
    return { kv in
        var result: [K: W] = [:]

        kv.forEach { key, value in
            result[key] = f(value)
        }

        return result
    }
}

["fisk": 1, "hest": 2, "hund": 3]
    |> map(incr)
/*:
 2. Implement the following function:

    ```
    transformSet: ((A) -> B) -> (Set<A>) -> Set<B>
    ```

    We do not call this `map` because it turns out to not satisfy the properties of `map` that we saw in this episode. What is it about the `Set` type that makes it subtly different from `Array`, and how does that affect the genericity of the `map` function?
 */
func transformSet<A, B>(_ f: @escaping (A) -> B) -> (Set<A>) -> Set<B> {
    return { set in
        var result: Set<B> = []

        set.forEach { result.insert(f($0)) }

        return result
    }
}

func strCntConcat(_ str: String) -> String { return "\(str): \(str.count)" }

["fjæsing", "torsk", "laks"]
    |> transformSet(strCntConcat)

/*:
 3. Recall that one of the most useful properties of `map` is the fact that it distributes over compositions, _i.e._ `map(f >>> g) == map(f) >>> map(g)` for any functions `f` and `g`. Using the `transformSet` function you defined in a previous example, find an example of functions `f` and `g` such that:

    ```
    transformSet(f >>> g) != transformSet(f) >>> transformSet(g)
    ```

    This is why we do not call this function `map`.
 */
// TODO
/*:
 4. There is another way of modeling sets that is different from `Set<A>` in the Swift standard library. It can also be defined as function `(A) -> Bool` that answers the question "is `a: A` contained in the set." Define a type `struct PredicateSet<A>` that wraps this function. Can you define the following?

     ```
     map: ((A) -> B) -> (PredicateSet<A>) -> PredicateSet<B>
     ```

     What goes wrong?
 */
// TODO
/*:
 5. Try flipping the direction of the arrow in the previous exercise. Can you define the following function?

    ```
    fakeMap: ((B) -> A) -> (PredicateSet<A>) -> PredicateSet<B>
    ```
 */
// TODO
/*:
 6. What kind of laws do you think `fakeMap` should satisfy?
 */
// TODO
/*:
 7. Sometimes we deal with types that have multiple type parameters, like `Either` and `Result`. For those types you can have multiple `map`s, one for each generic, and no one version is “more” correct than the other. Instead, you can define a `bimap` function that takes care of transforming both type parameters at once. Do this for `Result` and `Either`.
 */
// TODO
