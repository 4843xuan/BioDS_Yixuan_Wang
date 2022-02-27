#The code could not run. I tried my best, but still failed to present the neural network in the paper completely. 
#But I put my thoughts and my understanding of the code here.
import torch, torchvision.models as models #Call library, call neural network code

def extract(patch): # Extract patch features
    input = patch
    rn18 = models.resnet18() #Call the RESnet18 model
    train rn18 with patch data, then predict the output with the trained model
    output = rn18(input)
    return output

def feature(bag): #Patches feature matrix is obtained
    FX = null #The final eigenmatrix of all fragments
    for patch in bag :
        fx = extraxt(patch)
        concatenate fx to FX
    return FX

def filter(patches_feature_matrix): #Mapping from patch Level to Bag Level
    #A function that maps patches features to BAG features
    return bag_feature

def transform(bag_feature): #Determine the bag category
    mlp_3l = nn.Sequential(nn.Linear(bag_feature, 128), nn.ReLU(), nn.Linear(128, 256), nn.ReLU(), nn.Linear(256, 128), nn.ReLU(), nn.Linear(128, 10)) #Layer 3 MLP network
    train mlp_3l with bag_feature data, then predict the output with the trained model
    output = mlp_3l(bag_feature)
    return output

#main function flow
cutting image into patches, n patches become a bag #Data processing + generate patches

for bag in bags: #Use the data from each bag to train and predict
    patches_feature = feature(bag)
    bag_feature = filter(patches_feature)
    result = transform(bag_feature)
    record the result of this bag #Record the result
