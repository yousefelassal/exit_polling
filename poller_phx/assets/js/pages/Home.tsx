import type { FC } from "react";

interface Props {
  name: string;
}

const Home: FC<Props> = ({ name }) => {
  return (
    <div className="p-4 w-full flex flex-col items-center min-h-screen">
      <h1>Welcome, {name}!</h1>
      <p>This is the Home component.</p>
      <a href="/districts" className="text-blue-500 hover:underline">
        View Districts
      </a>
    </div>
  );
};

export default Home;
