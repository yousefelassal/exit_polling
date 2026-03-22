import type { FC } from "react";

interface Props {
  name: string;
}

const Home: FC<Props> = ({ name }) => {
  return (
    <div>
      <h1>Welcome, {name}!</h1>
      <p>This is the Home component.</p>
    </div>
  );
};

export default Home;
