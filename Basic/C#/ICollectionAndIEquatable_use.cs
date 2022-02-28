using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Text;

namespace CSharp
{
    //ICollection<T>接口定义了操作泛型集合的方法
    //IEquatable和IEqualityComparer接口
    public class Box : IEquatable<Box>
    {
        public int w;
        public int h;
        public int l;

        public Box(int w, int h, int l)
        {
            this.w = w;
            this.h = h;
            this.l = l;
        }

        public int Vol
        {
            get
            {
                return w * h * l;
            }
        }

        public bool Equals(Box other)
        {
            return new BoxVol().Equals(this, other);
        }
    }

    public class BoxVol : IEqualityComparer<Box>
    {
        public bool Equals(Box x, Box y)
        {
            return x.Vol > y.Vol;
        }

        public int GetHashCode(Box obj)
        {
            int hashCode = obj.w ^ obj.h ^ obj.l;
            return hashCode.GetHashCode();
        }
    }

    public class BoxCollection : ICollection<Box>
    {
        List<Box> _boxes;
        public BoxCollection()
        {
            _boxes = new List<Box>();
        }

        public Box this[int index]
        {
            get
            {
                return _boxes[index];
            }
            set
            {
                _boxes[index] = value;
            }
        }

        public int Count => _boxes.Count;

        public bool IsReadOnly => false;

        public void Add(Box item)
        {
            _boxes.Add(item);
        }

        public void Clear()
        {
            _boxes.Clear();
        }

        public bool Contains(Box item)
        {
            return _boxes.Contains(item);
        }

        public bool Contains(Box item, IEqualityComparer<Box> boxVol)
        {
            bool isHave = false;
            foreach (var box in _boxes)
            {
                if(boxVol.Equals(box, item))
                {
                    isHave = true;
                    break;
                }
            }
            return isHave;
        }

        public void CopyTo(Box[] array, int arrayIndex)
        {
            if (array == null)
            {
                throw new ArgumentNullException("array is null");
            }
            else if(arrayIndex < 0)
            {
                throw new ArgumentOutOfRangeException("arrayIndex < 0");
            }
            else if(Count > array.Length - arrayIndex + 1)
            {
                throw new ArgumentException("放不下");
            }

            for (int i = 0; i < Count; i++)
            {
                array[arrayIndex + i] = _boxes[i];
            }
        }

        public IEnumerator<Box> GetEnumerator()
        {
            return new BoxEnumerator(this);
        }

        public bool Remove(Box item)
        {
            return _boxes.Remove(item);
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return this.GetEnumerator();
        }
    }

    public class BoxEnumerator : IEnumerator<Box>
    {
        BoxCollection _boxCollection;
        int _position;
        Box _curBox;
        public BoxEnumerator(BoxCollection boxes)
        {
            _boxCollection = boxes;
            _position = -1;
            _curBox = default(Box);
        }

        
        public Box Current
        {
            get {
                try
                {
                    _curBox = _boxCollection[_position];
                    return _curBox;
                }
                catch (Exception)
                {
                    //方法调用对象当前状态无效引发的异常
                    throw new InvalidOperationException();
                }
            }
        }

        object IEnumerator.Current => Current;

        void IDisposable.Dispose() { }

        public bool MoveNext()
        {
            _position++;
            return _position < _boxCollection.Count;
        }

        public void Reset()
        {
            _position = -1;
        }
    }

    #region 主程序测试代码
    //Box box1 = new Box(10, 10, 10);
    //Box box2 = new Box(12, 12, 12);
    //Box box3 = new Box(14, 14, 14);

    //BoxCollection boxes = new BoxCollection();
    //boxes.Add(box1);
    //boxes.Add(box2);
    //boxes.Add(box3);

    //Console.WriteLine("是否有box1: " + boxes.Contains(box1).ToString());
    //Console.WriteLine("是否有与box2体积相同的box: " + boxes.Contains(box2, new BoxVol()).ToString());

    //foreach (var item in boxes)
    //{
    //    Console.WriteLine("box的体积：" + item.Vol);
    //}

    //boxes.Remove(box1);
    //Console.WriteLine("有多少个box: " + boxes.Count);

    //Box[] arr = new Box[2];
    //boxes.CopyTo(arr, 0);

    //foreach (var item in arr)
    //{
    //    Console.WriteLine("box的体积：" + item.Vol);
    //}
    #endregion


}
