package com.timemanagement.repository;

interface IRepository<T> {

    public T get(int id);

    public void add(T item);

    public void delete(int id);

}
