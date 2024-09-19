import 'package:docs_clone/screens/home_screen.dart';
import 'package:docs_clone/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes:{
 
  '/':(route)=> const MaterialPage(child : Login_screen()),

});
final loggedInRoute = RouteMap(routes:{
 
  '/':(route)=> const MaterialPage(child : HomeScreen()),

});