TBQuadTree
==========

Installing
----------
    pod 'TBQuadTree', :git => 'git@github.com:theocalmes/TBQuadTree.git'

or you can just drag the source code into your project.

How to use
----------

The quad tree is composed of `TBQuadTreeNodeData` structs:

    typedef struct TBQuadTreeNodeData {
        double x;
        double y;
        void* data;
    } TBQuadTreeNodeData;
    TBQuadTreeNodeData TBQuadTreeNodeDataMake(double x, double y, void* data);
  
The `void* data` is a generic pointer which you can use to store additional information.

Here is an example quad tree made with random data:

    double TBRandomRange(double low, double high)
    {
        return ((double)arc4random() / 0x100000000) * (high - low) + low;
    }
  
    TBQuadTreeNode* TBBuildRandomQuadTree() 
    {
      int points = 1E6;
      TBQuadTreeNodeData *data = malloc(sizeof(TBQuadTreeNodeData) * points); 
      for (int i = 0; i < points; i++) {
        TBQuadTreeNodeDataMake(TBRandomRange(0, 320), TBRandomRange(0, 320), NULL);
      }

      TBBoundingBox world = TBBoundingBoxMake(0, 0, 320, 320);
      TBQuadTreeNode *root = TBQuadTreeBuildWithData(data, points, world, 4);

      return root;
    }
  
To query the quad tree use `TBQuadTreeGatherDataInRange`

    void exampleQuery(TBQuadTreeNode* quadTree)
    {
        TBBoundingBox queryBoundingBox = TBBoundingBoxMake(34.2, 28.1, 38.2, 33);
        TBQuadTreeGatherDataInRange(quadTree, queryBoundingBox, ^(TBQuadTreeNodeData data) {
          NSLog(@"Coordinate: (%F, %F)", data.x, data.y);
        }
    }
