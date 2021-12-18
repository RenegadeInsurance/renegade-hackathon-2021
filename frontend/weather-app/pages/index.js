
import HomePage from '../src/components/HomePage'
import {
  useQuery,
  useMutation,
  useQueryClient,
  QueryClient,
  QueryClientProvider,
} from 'react-query'

const queryClient = new QueryClient()



export default function Home() {
  return (
  <QueryClientProvider client={queryClient}>
    <div className="bg-drak_blue_background w-full min-h-screen text-white">
      <HomePage/>
    </div>
  </QueryClientProvider>
  )
}
