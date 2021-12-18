import Head from 'next/head';
import Image from 'next/image';
import React, { useState } from 'react';
import styles from '../styles/Home.module.css';
import Block from '../comp/form-block';

export default function Home() {
  const [formData, setFormData] = useState({
    "name": "",
    "blocks": [{
      name: "",
      type: "",
      fields: []
    }]
  });

  const addBlock = () => {
    setFormData({
      ...formData,
      blocks: [...formData.blocks, {
        name: "",
        fields: []
      }]
    });
  }

  const updateBlock = (index, value) => {
    const newBlocks = [...formData.blocks];
    newBlocks[index] = value;
    setFormData({
      ...formData,
      blocks: newBlocks
    });
  };

  return (
    <div className={styles.container}>
      {
        formData.blocks.map((item, index) => {
          return <Block
            index={index}
            details={item}
            onUpdate={updateBlock}
            />
        })
      }
      <button onClick={e => addBlock()}>Add Block</button>
      <pre>
      {JSON.stringify(formData.blocks, null, 2)}
      </pre>
    </div>
  );
}
