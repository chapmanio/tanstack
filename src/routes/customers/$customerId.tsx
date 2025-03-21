import { createFileRoute } from '@tanstack/react-router';

export const Route = createFileRoute('/customers/$customerId')({
  component: Customer,
});

function Customer() {
  const { customerId } = Route.useParams();

  return <div>Customer ID: {customerId}</div>;
}
