import { useState, useEffect } from 'react';
import {
  SpeedDial,
  SpeedDialAction,
  SpeedDialIcon,
  Tooltip,
  ClickAwayListener,
} from '@mui/material';
import {
  CloudSyncTwoTone as CloudSyncTwoToneIcon,
  FmdBadTwoTone as FmdBadTwoToneIcon,
} from '@mui/icons-material';
import { Link } from 'react-router-dom';

const CustomSpeedDial = () => {
  const [tooltipOpen, setTooltipOpen] = useState(
    JSON.parse(localStorage.getItem('userFT')) === true ? false : true
  );

  const withLink = (to, children) => (
    <Link to={to} style={{ color: 'inherit', textDecoration: 'inherit' }}>
      {children}
    </Link>
  );
  const actions = [
    {
      icon: withLink('/login', <CloudSyncTwoToneIcon />),
      name: 'Sync information',
    },
    {
      icon: withLink('/users', <FmdBadTwoToneIcon />),
      name: 'Risk in your zone? Send alerts',
    },
  ];

  const handleTooltipClose = () => {
    setTooltipOpen(false);
    localStorage.setItem('userFT', false);
  };

  useEffect(() => {
    setTooltipOpen(!tooltipOpen);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <ClickAwayListener onClickAway={handleTooltipClose}>
      <div>
        <Tooltip
          PopperProps={{
            disablePortal: true,
          }}
          onClose={handleTooltipClose}
          open={tooltipOpen}
          placement='left-end'
          disableFocusListener
          disableHoverListener
          disableTouchListener
          title='New user? Click here for more information'
          arrow
        >
          {/* <Button onClick={handleTooltipOpen}>Click</Button> */}
          <SpeedDial
            ariaLabel='SpeedDial basic example'
            icon={<SpeedDialIcon />}
          >
            {actions.map((action) => (
              <SpeedDialAction
                key={action.name}
                icon={action.icon}
                tooltipTitle={action.name}
                sx={{ textAlign: `center` }}
                arrow
              />
            ))}
          </SpeedDial>
        </Tooltip>
      </div>
    </ClickAwayListener>
  );
};

export default CustomSpeedDial;
