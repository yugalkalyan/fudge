part of 'first_screen.dart';

class TopUsers extends StatefulWidget {
  const TopUsers({super.key});

  @override
  State<TopUsers> createState() => _TopUsersState();
}

class _TopUsersState extends State<TopUsers> {
  
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TopUsersBloc>(
        create: (_) => TopUsersBloc()..add(const FetchTopUsers()),
        child: BlocBuilder<TopUsersBloc, TopUsersStates>(
          builder: (context, state) {
            switch(state.status){
            case Status.loading:
            return CircularProgressIndicator();
              case   Status.success:
                return Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("TOP USERS FROM YOUR COMMUNITY",
                          style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 12)),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 77,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.userName.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/icons/user_image.png"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(state.userName[index], textAlign: TextAlign.left,style: GoogleFonts.roboto(fontSize: 12)),
                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                );
              case Status.failure:
                return const Text("Unable to fetch user list",style: TextStyle(color: Colors.red),);
            default:
            return const SizedBox.shrink();
            }
         
          },
        ));
  }
}
