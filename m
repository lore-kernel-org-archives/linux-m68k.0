From: Thomas Graf <tgraf@suug.ch>
Subject: Re: concurrent rhashtable test failure
Date: Wed, 26 Oct 2016 11:51:39 +0200
Message-ID: <20161026095139.GA16590__31902.8510865339$1477475522$gmane$org@pox.localdomain>
References: <CAMuHMdWTqXaJAM-O+mmha=JbuyvvNxYyHuV6e4YK7oUkh9rCkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWTqXaJAM-O+mmha=JbuyvvNxYyHuV6e4YK7oUkh9rCkA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Phil Sutter <phil@nwl.cc>, Herbert Xu <herbert@gondor.apana.org.au>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On 10/24/16 at 02:11pm, Geert Uytterhoeven wrote:
> Hi Phil,
> 
> On m68k/ARAnyM, test_rhashtable fails with:
> 
>     Test failed: thread 0 returned: -4
> 
> (-4 = -EINTR)

The error is returned by kthread_stop(), I suspect we are running into
this:

static int kthread(void *_create)
{
	[...]
        complete(done);
        schedule();

        ret = -EINTR;

        if (!test_bit(KTHREAD_SHOULD_STOP, &self.flags)) {
                __kthread_parkme(&self);
                ret = threadfn(data);
        }
        /* we can't just return, we must preserve "self" on stack */
        do_exit(ret);
}
