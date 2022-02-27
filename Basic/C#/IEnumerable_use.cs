using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace CSharp
{
    //IEnumerable 和 IEnumerator配合使用可以实现自定义类的迭代
    //IEnumerable返回一个继承IEnumerator接口的对象
    //IEnumerator用来实现迭代时真正的操作
    //还有泛型版本 IEnumerable<T> 和 IEnumerator<T>
    public class Person
    {
        private string _name;
        private int _age;
        public Person(string name, int age)
        {
            _name = name;
            _age = age;
        }

        public void PrintInfo()
        {
            Console.WriteLine("name is: " + _name + " " + "age is: " + " " + _age.ToString());
        }
    }

    public class People : IEnumerable
    {
        private Person[] _personArr;
        //private PeopleEnum _peopleEnum;
        public People(Person[] arr)
        {
            _personArr = new Person[arr.Length];
            for (int i = 0; i < arr.Length; i++)
            {
                _personArr[i] = arr[i];
            }
            //_peopleEnum = new PeopleEnum(_personArr);
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }

        public IEnumerator GetEnumerator()
        {
            return new PeopleEnum(_personArr);
        }
    }

    public class PeopleEnum : IEnumerator
    {
        private Person[] _personArr;
        private int _position = -1;

        public PeopleEnum(Person[] arr)
        {
            _personArr = arr;
        }

        object IEnumerator.Current => Current;

        public Person Current
        {
            get{
                try
                {
                    return _personArr[_position];
                }
                catch (Exception)
                {

                    throw new InvalidOperationException();
                }
            }
        }

        bool IEnumerator.MoveNext()
        {
            _position++;
            return _position < _personArr.Length;
        }

        void IEnumerator.Reset()
        {
            _position = -1;
        }
    }

    #region 主程序代码
    //Person[] personArr = new Person[] {
    //    new Person("paige1", 18),
    //    new Person("paige2", 20),
    //    new Person("paige3", 22)
    //};
    //People people = new People(personArr);
    //foreach (Person item in people)
    //{
    //    item.PrintInfo();
    //}
    #endregion

}
