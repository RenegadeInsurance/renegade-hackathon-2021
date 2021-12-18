import { useState } from 'react';

function Block(props) {
  const { details, index, onUpdate } = props;

  const addNewField = e => {
    const newField = {
      weight: {
        min: 0,
        likely: 0,
        max: 0,
      },
      title: '',
      type: '',
      options: [
        {
          weight: 10,
          value: '',
        },
        {
          weight: 10,
          value: '',
        },
      ],
    };
    const blockDetail = { ...details };
    blockDetail.fields.push({ ...newField });
    onUpdate(blockDetail);
  };

  const blockTypes = [
    {
      label: 'Simple',
      value: 'SIMPLE',
    },
    {
      label: 'SURVEY',
      value: 'SURVEY',
    },
  ];

  const updateBlockDetail = (e, key) => {
    console.log(e.target.value);
    const blockDetail = { ...details };
    blockDetail.name = e.target.value;
    onUpdate(index, blockDetail);
  };
  return (
    <div className="card">
      <h3>{details.name || `Block${index}`}</h3>
      <InputField
        name="Block Name"
        onChangeAction={e => updateBlockDetail(e, 'name')}
      />
      <SelectBox
        name="type"
        options={blockTypes}
        onChangeAction={e => updateBlockDetail(e, 'type')}
      />
      <fieldset>
        <label>Fields</label>
        <div>
          {details.fields.map((field, i) => {
            {
              field;
            }
          })}
        </div>
      </fieldset>
      <button onClick={e => addNewField()}>Add Field</button>
    </div>
  );
}

function InputField(props) {
  const { name, label, type, onChangeAction, min, max} = props;
  const [value, setValue] = useState('');
  return (
    <div>
      <label>
        {label} {type === 'range' ? `(${value || 0})` : ''}
      </label>
      <input
        type={type || 'text'}
        name={name}
        key={name}
        className="form-control form-control-sm"
        onChange={e => {
          setValue(e.target.value);
          onChangeAction(e);
        }}
        defaultValue={type === 'range' ? `${value || 0}` : value}
        min={min}
        max={max}
        placeholder={label || name}
      />
    </div>
  );
}

function SelectBox(props) {
  const { name, options, onChangeAction } = props;
  return (
    <select name={name} key={name} onChange={onChangeAction} defaultValue="">
      <option key={`${name}-no-val`} value="" disabled>
        Select Block Type
      </option>
      {options.map((item, i) => (
        <option key={`${name}_${item.value}-${i}`} value={item.value}>
          {item.label}
        </option>
      ))}
    </select>
  );
}

export default Block;
export { InputField };
