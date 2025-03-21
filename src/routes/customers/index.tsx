import { createFileRoute } from '@tanstack/react-router';

export const Route = createFileRoute('/customers/')({
  component: Customers,
});

function Customers() {
  return <div>Customers</div>;
}
