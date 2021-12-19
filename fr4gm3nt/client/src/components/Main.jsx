import { Link } from "react-router-dom";
import { Card } from "antd";
import { CloudOutlined } from "@ant-design/icons";

const { Meta } = Card;

const Main = () => {
  return (
    <>
      <div className="flex">
        <Link
          to="/create-form"
          className="py-4 px-4 hover:text-blue-800 transition duration-300"
        >
          <Card
            hoverable
            style={{ width: 240, height: 240 }}
            cover={
              <img
                alt="create-form"
                src="https://maxcdn.icons8.com/Share/icon/Logos/google_forms1600.png"
              />
            }
          >
            <Meta title="Create Form" />
          </Card>
        </Link>
        <Link
          to="/weather"
          className="py-4 px-4 hover:text-blue-800 transition duration-300"
        >
          <Card
            hoverable
            style={{ width: 240, height: 240 }}
            cover={
              <img
                alt="weather"
                src="https://i.pinimg.com/originals/53/8c/32/538c32489d4b9ea44ff34f63e41ca14c.png"
              />
            }
          >
            <Meta title="Weather" />
          </Card>
        </Link>
        <Link
          to="/forms"
          className="py-4 px-4 hover:text-blue-800 transition duration-300"
        >
          <Card
            hoverable
            style={{ width: "240px", height: 200 }}
            cover={
              <img
                alt="view forms"
                src="https://thumbs.dreamstime.com/b/fill-form-line-icon-filled-outline-vector-sign-linear-colorful-pictogram-isolated-white-edit-symbol-logo-illustration-95331560.jpg"
              />
            }
          >
            <Meta title="View Available Forms" />
          </Card>
        </Link>
        <Link
          to="/submissions"
          className="py-4 px-4 hover:text-blue-800 transition duration-300"
        >
          <Card
            hoverable
            style={{ width: 240, height: 240 }}
            cover={
              <img
                alt="Form Submissions"
                src="https://maxcdn.icons8.com/Share/icon/Logos/google_forms1600.png"
              />
            }
          >
            <Meta title="Form Submissions" />
          </Card>
        </Link>
      </div>
    </>
  );
};

export default Main;
