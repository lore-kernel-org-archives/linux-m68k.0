From: Phil Sutter <phil@nwl.cc>
Subject: Re: concurrent rhashtable test failure
Date: Wed, 26 Oct 2016 09:33:37 +0200
Message-ID: <20161026073337.GM5640__42186.3949079581$1477467250$gmane$org@orbyte.nwl.cc>
References: <CAMuHMdWTqXaJAM-O+mmha=JbuyvvNxYyHuV6e4YK7oUkh9rCkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWTqXaJAM-O+mmha=JbuyvvNxYyHuV6e4YK7oUkh9rCkA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Graf <tgraf@suug.ch>, Herbert Xu <herbert@gondor.apana.org.au>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Geert,

On Mon, Oct 24, 2016 at 02:11:32PM +0200, Geert Uytterhoeven wrote:
> On m68k/ARAnyM, test_rhashtable fails with:
> 
>     Test failed: thread 0 returned: -4
> 
> (-4 = -EINTR)

How reproducible is this? I wonder why out of the ten threads only the
first one fails.

> I traced this back to your commit f4a3e90ba5739cfd ("rhashtable-test: extend
> to test concurrency"), which added that part of the test.
> 
> Diff of the test output between the failing commit and its parent:
> 
>  Running rhashtable test nelem=8, max_size=65536, shrinking=0
>  Test 00:
>    Adding 50000 keys
>    Traversal complete: counted=50000, nelems=50000, entries=50000, table-jumps=0
>    Traversal complete: counted=50000, nelems=50000, entries=50000, table-jumps=0
>    Deleting 50000 keys
> -  Duration of test: 1029960000 ns
> +  Duration of test: 990000000 ns
>  Test 01:
>    Adding 50000 keys
>    Traversal complete: counted=50000, nelems=50000, entries=50000, table-jumps=0
>    Traversal complete: counted=50000, nelems=50000, entries=50000, table-jumps=0
>    Deleting 50000 keys
> -  Duration of test: 990000000 ns
> +  Duration of test: 720000000 ns
>  Test 02:
>    Adding 50000 keys
>    Traversal complete: counted=50000, nelems=50000, entries=50000, table-jumps=0
>    Traversal complete: counted=50000, nelems=50000, entries=50000, table-jumps=0
>    Deleting 50000 keys
> -  Duration of test: 1130000000 ns
> +  Duration of test: 700000000 ns
>  Test 03:
>    Adding 50000 keys
>    Traversal complete: counted=50000, nelems=50000, entries=50000, table-jumps=0
>    Traversal complete: counted=50000, nelems=50000, entries=50000, table-jumps=0
>    Deleting 50000 keys
> -  Duration of test: 1080000000 ns
> -Average test time: 1057490000
> +  Duration of test: 700000000 ns
> +Average test time: 777500000
> +Testing concurrent rhashtable access from 10 threads
> +Test failed: thread 0 returned: -4
> +Started 10 threads, 1 failed
> 
> Do you have any clue?

Not really, I merely implemented the test.

Thanks, Phil
