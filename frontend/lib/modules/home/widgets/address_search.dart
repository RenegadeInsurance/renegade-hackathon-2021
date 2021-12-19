import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_alert/modules/home/bloc/fetchsuggestion/fetchsuggestion_bloc.dart';
import 'package:we_alert/modules/home/repository/fetchaddresssugestion/fetchaddresssuggestion_impl.dart';

class AddressSearch extends SearchDelegate {
  AddressSearch(this.sessionToken) {
    apiClient = FetchAddressSuggestion(sessionToken);
  }
  final String sessionToken;
  FetchAddressSuggestion? apiClient;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: "Clear",
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: "Back",
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<FetchsuggestionBloc>().add(FetchSuggestion(querytext: query));
    return BlocBuilder<FetchsuggestionBloc, FetchsuggestionState>(
      builder: (context, state) {
        if (state is FetchsuggestionInitial) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: const Center(child: Text("Enter your address")),
          );
        } else if (state is FetchsuggestionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchsuggestionLoaded) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        (state.fetchedsuggestions![index]).description,
                        style: const TextStyle(fontSize: 18),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  close(context, state.fetchedsuggestions![index]);
                },
              ),
              itemCount: state.fetchedsuggestions!.length,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
