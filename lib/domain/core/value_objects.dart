import 'package:classpay_new/domain/core/errors.dart';
import 'package:classpay_new/domain/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObject<T>{
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  @override
  bool operator == (Object other) {
    if(identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }
  T getOrCrash(){
    return value.fold((f) => throw UnexpectedValueError(f), (r) => r);
  }
  bool get  isValid => value.isRight();

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Value($value)';
  }

}

class UniqueId extends ValueObject<String>{
  @override
  // TODO: implement value
 final Either<ValueFailure<String>, String>  value ;

  factory UniqueId(){
    return UniqueId._(right(const Uuid().v1()));
  }

  factory UniqueId.fromUniqueString(String uniqueId){
    return UniqueId._(right(uniqueId));
  }


 const UniqueId._(this.value);


}

