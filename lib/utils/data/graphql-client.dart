import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink(
  'https://todo-anchovy-18.hasura.app/v1/graphql',
);

final AuthLink authLink = AuthLink(
  getToken: () async => 'mcazlQyxcBsN6YjOhu4T32YhwyK0KpXrdTz2JVMZslYBmLr2arSYLK1KaIGXueNU',
  headerKey: 'x-hasura-admin-secret',
);

final Link link = authLink.concat(httpLink);

ValueNotifier<GraphQLClient> graphqlClient = ValueNotifier(
  GraphQLClient(
    link: link,
    cache: GraphQLCache(store: HiveStore()),
  ),
);

final todographClient = GraphQLClient(
  link: link,
  cache: GraphQLCache(store: HiveStore()),
);