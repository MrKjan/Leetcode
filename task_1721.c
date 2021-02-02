#include<stdio.h>
#include<stdlib.h>
#define log printf

// Definition for singly-linked list.
// struct ListNode
// {
//     int val;
//     struct ListNode *next;
// };

// Init list
struct ListNode *initList(int *values, int size)
{
    struct ListNode* list = calloc(size, sizeof(struct ListNode));
    if (NULL == list)
        return NULL;
    
    for (int ii=0; ii<(size-1); ii++)
    {
        (list + ii)->val = values[ii];
        (list + ii)->next = list + ii + 1;
    }
    (list + size - 1)->val = values[size-1];
    (list + size - 1)->next = NULL;
    
    return list;
}

// Show list
void showList(struct ListNode* list)
{
    
    struct ListNode* iter = list;

    for(; iter!=NULL; iter=iter->next)
    {
        printf("%d ", iter->val);
    }
    printf("\n");
}

// Assist func, returns next pair
struct ListNode *swapOnePair(struct ListNode **pair)
{
    if (NULL == *pair || NULL == (*pair)->next)
        return NULL;
    
    struct ListNode *secondElem = (*pair)->next;
    struct ListNode *nextPair = secondElem->next;
    struct ListNode **ret = &((*pair)->next);

    // Core
    (*pair)->next = nextPair;
    secondElem->next = *pair;
    *pair = secondElem;

    return ret;
}

// Answer
struct ListNode *swapPairs(struct ListNode* head)
{
    struct ListNode **iter = &head;
    
    while (NULL != (iter = swapOnePair(iter)))
    {
        // Pass
    }
    
    return head;    
}

int main(void)
{
    int data[] = {1,2,3,4,5,6,7,8};

    struct ListNode* list;
    list = initList(data, 5);
    showList(list);
    showList(swapPairs(list));
    free(list);
    return 0;
}
