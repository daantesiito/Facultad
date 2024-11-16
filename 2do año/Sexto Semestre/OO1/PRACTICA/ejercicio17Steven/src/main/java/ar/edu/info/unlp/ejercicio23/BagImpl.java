package ar.edu.info.unlp.ejercicio23;

import java.util.AbstractCollection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class BagImpl<T> extends AbstractCollection<T> implements Bag<T> {

    Map<T, Integer> elements;

    public BagImpl() {
        this.elements = new HashMap<>();
    }

    @Override
    public boolean add(T element) {
    this.elements.put(element, this.occurrencesOf(element) + 1);
    return true;
    }

    @Override
    public int occurrencesOf(T element) {
        return this.elements.getOrDefault(element, 0);
    }

    @Override
    public void removeOccurrence(T element) {
        this.elements.replace(element, this.occurrencesOf(element) - 1);
    }

    @Override
    public void removeAll(T element) {
        this.elements.remove(element);
    }

    @Override
    public int size() {
        return this.elements.values().stream().mapToInt(Integer::intValue).sum();
    }
    
    public Set<Map.Entry<T, Integer>> entrySet() {
        return this.elements.entrySet();
    }

    @Override
    public Iterator<T> iterator() {
        return new Iterator<T>() {
            private Iterator<Map.Entry<T, Integer>> entryIterator = elements.entrySet().iterator();
            private Map.Entry<T, Integer> currentEntry;
            private int remainingCount;

            @Override
            public boolean hasNext() {
                return remainingCount > 0 || entryIterator.hasNext();
            }

            @Override
            public T next() {
                if (remainingCount == 0) {
                    currentEntry = entryIterator.next();
                    remainingCount = currentEntry.getValue();
                }
                remainingCount--;
                return currentEntry.getKey();
            }

            @Override
            public void remove() {
                removeOccurrence(currentEntry.getKey());
            }
        };
    }
}