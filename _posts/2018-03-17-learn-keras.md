---
layout: single
title: Keras, a python deep learning library
category: machine-learning
tags: Keras
---

Recently I discovered [Keras](https://keras.io/), a python deep learning library. It provides high-level neural networks API, supports multiple backends (TensorFlow, CNTK, and Theano), and allows fast experimentation.

The key philosophy of the library seems to be *being able to go from idea to result with the least possible delay*. The library seemingly makes prototyping very easy. With it users can build both convolutional networks and recurrent networks, as well as combinations of the two. And it runs seamlessly on CPU and GPU.

## Installation

Keras documentation website, [https://keras.io/](https://keras.io), provides clear [installation instructions](https://keras.io/#installation). I used pip installation and Theano as backend and encountered no problem.

A particular point for those 32-bit machine users (for instance due to virtual machine limitation): while it is extremely challenging to compile tensorflow (when possible at all) in 32-bit machines, Theano has no problem compiling and therefore Keras, supporting multiple backends, can be used to train simple models. Though my experience is that training with Theano seems to be slower than Tensorflow, but for fast prototyping and quick checks the speed suffices.


## Example

Here we use `Sequential`, the simplest type of model in Keras, which represents a linear stack of layers, to demonstrate the use of the library. 

Key steps are:

1. Model specification
2. Model compilation
3. Data collection or generation
4. Model training with training data
5. Model evaluation with testing data

First we build a two-layer model, with the first ReLu layer of 32 nodes and the second Softmax layer of 10 nodes. The input data is a 100-dimensional vector.

```python
from keras.models import Sequential
from keras.layers import Dense, Activation

model = Sequential([
    Dense(32, input_shape=(100,)),
    Activation('relu'),
    Dense(10),
    Activation('softmax'),
])
```

Models need to be *compiled* first. Namely optimizer, loss function, and metrics need to be specified before the model can be trained.

```python
model.compile(optimizer='rmsprop',
		loss='categorical_crossentropy',
		metrics=['accuracy'])
```

Next we generate dummy data for categorical classification of 10 classes.

```python
import numpy as np

data = np.random.random([1000, 100])
labels = np.random.randint(10, size=(1000, 1))

# Convert labels to categorical one-hot encoding (see https://en.wikipedia.org/wiki/One-hot for definition)
one_hot_labels = keras.utils.to_categorical(labels, num_classes=10)
```

Now we train the model, iterating on the data in batches of 32 samples

```python
model.fit(data, one_hot_labels, epochs=10, batch_size=32)
```

Finally we can *evaluate* how the model performs.

```python
x_test = np.random.random((50, 100))
y_test = np.random.randint(10, size=(50, 1))
y_test_one_hot = keras.utils.to_categorical(y_test, num_classes=10)
scores = model.evaluate(x_test, y_test_one_hot, batch_size=128)
```

The scores are loss and accuracy, which can be found out by `model.metrics_names`.

## More examples

More examples of sequential models using either dummy or real data can be found [on the Keras website](https://keras.io/getting-started/sequential-model-guide/), including convolutional neural network (CNN) with real data augmentation, [Long short-term memory](https://en.wikipedia.org/wiki/Long_short-term_memory) (LSTM) for sequence of words, [multilayer perception](https://en.wikipedia.org/wiki/Multilayer_perceptron) (MLP) for topic classification, and all kinds of combinations.

## Conclusions

I am excited by the userfriendliness and modularity of Keras. I am sure future exploration and experimentation will follow.

## Synopsis

<dl>
<dt>LSTM</dt>
<dd>Long short-term memory(LSTM) units are a building unit for layers of a recurrent neural network (RNN). A common LSTM unit is composed of a **cell**, an **input gate**, an **output gate**, and a **forget gate**. The cell is responsible for "remembering" values of arbitrary time intervals. The three *gates* can be thought as a "conventional* artificial neuron. LTSM can be used to classify, process, and predict time series given time lags of unkown size and duration between important events. It is relative insensitive to gap lengths, which is an advatnage over alternative RNNs, hidden Markov models, and other sequence learning models. </dd>
<dt>MLP</dt>
<dd>A class of feedforward artificial neural network. An MLP consists of at least three layers of nodes. Except for the input nodes, each node is a neuron that uses a **nonlinear** activation function. They are sometimes called *vanilla neural networks*.</dd>
</dl>
