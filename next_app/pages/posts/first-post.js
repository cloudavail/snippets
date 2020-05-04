import Link from 'next/link'
import Head from 'next/head'


export default function FirstPost() {
  return (
    <>
      <h1>Hello Cloudavail!</h1>
      <h2>
        <Link href="/">
          <a>Back to home</a>
        </Link>
             <Head>
        <title>First Post</title>
      </Head>
      </h2>
    </>
  )
}