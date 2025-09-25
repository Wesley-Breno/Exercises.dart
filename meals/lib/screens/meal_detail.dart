import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:provider/provider.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  final ScrollController _stepsScrollController = ScrollController();
  final ScrollController _ingredientsScrollController = ScrollController();
  late List<bool> _checkedIngredients;

  @override
  void initState() {
    super.initState();
    _checkedIngredients = List.filled(widget.meal.ingredients.length, false);
  }

  @override
  void dispose() {
    _stepsScrollController.dispose();
    _ingredientsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            icon: favoritesProvider.isFavorite(widget.meal.id)
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_outline),
            onPressed: () {
              setState(() {
                final isFav = favoritesProvider.isFavorite(widget.meal.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      isFav
                        ? 'Removido dos favoritos!'
                        : 'Adicionado aos favoritos!',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
                favoritesProvider.toggleFavorite(widget.meal.id);
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              child: Image.network(
                widget.meal.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${widget.meal.duration} min | ${widget.meal.complexity.name[0].toUpperCase()}${widget.meal.complexity.name.substring(1)} | ${widget.meal.affordability.name[0].toUpperCase()}${widget.meal.affordability.name.substring(1)}',
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.meal.title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 350,
              child: PageView(
                controller: PageController(viewportFraction: 0.90),
                children: [
                  Card(
                    color: const Color.fromARGB(99, 119, 66, 6),
                    margin: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    clipBehavior: Clip.hardEdge,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Text(
                            'Ingredients',
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 235, // ajuste conforme necessário
                            child: Scrollbar(
                              controller: _ingredientsScrollController,
                              thumbVisibility: true,
                              child: ListView.builder(
                                controller: _ingredientsScrollController,
                                itemCount: widget.meal.ingredients.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                      value: _checkedIngredients[index],
                                      onChanged: (bool? value) {
                                        setState(() {
                                        _checkedIngredients[index] =
                                          value ?? false;
                                        });
                                      },
                                      ),
                                      Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Text(
                                        widget.meal.ingredients[index],
                                        style: const TextStyle(
                                          color: Colors.white70,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: true,
                                        ),
                                      ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Card(
                    color: const Color.fromARGB(99, 119, 66, 6),
                    margin: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    clipBehavior: Clip.hardEdge,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Text(
                            'Steps',
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 235, // ajuste conforme necessário
                            child: Scrollbar(
                              controller: _stepsScrollController,
                              thumbVisibility: true,
                              child: ListView.builder(
                                controller: _stepsScrollController,
                                itemCount: widget.meal.steps.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                      horizontal: 8.0,
                                    ),
                                    child: Text(
                                      '${index + 1}. ${widget.meal.steps[index]}',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
