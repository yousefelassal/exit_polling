import type { FC } from "react";

interface Props {
  name: string;
}

const Districts: FC<Props> = ({ name }) => {
  return (
    <div className="p-4 w-full flex flex-col items-center min-h-screen">
      <h1>Welcome, {name}!</h1>
      <p>This is the Districts component.</p>
    </div>
  );
};

export default Districts;
