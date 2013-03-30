From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Sat, 30 Mar 2013 10:23:56 +0100
Message-ID: <20130330092356.GA27328@chumley.earth.sol>
References: <5154C5E0.3040608@gmail.com>
 <20130328231039.GA14587@chumley.earth.sol>
 <CAMuHMdWxCW0Gp8jYYk7R3WDJ8u-LJBZJ5d9jjaPAf27vXv3jDA@mail.gmail.com>
 <20130329080629.GB14587@chumley.earth.sol>
 <CAMuHMdXcy8Apvm58m4XudxfRTRa9aiTojRVanPtY3M=mTUUxqg@mail.gmail.com>
 <5155E1A3.7060307@gmail.com>
 <20130329193323.GD14587@chumley.earth.sol>
 <Pine.BSM.4.64L.1303292135220.3992@herc.mirbsd.org>
 <20130329224731.GA22830@chumley.earth.sol>
 <51569301.9030507@uter.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-07.arcor-online.net ([151.189.21.47]:60008 "EHLO
	mail-in-07.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755515Ab3C3JYA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 30 Mar 2013 05:24:00 -0400
Content-Disposition: inline
In-Reply-To: <51569301.9030507@uter.be>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Wouter Verhelst <w@uter.be>
Cc: Thorsten Glaser <tg@mirbsd.de>, Michael Schmitz <schmitzmic@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, Ingo J?rgensmann <ij@2012.bluespice.org>

Wouter,
On Sat, Mar 30, 2013 at 08:23:45AM +0100, Wouter Verhelst wrote:
> On 29-03-13 23:47, Christian T. Steigies wrote:
> > On Fri, Mar 29, 2013 at 09:38:31PM +0000, Thorsten Glaser wrote:
> >>
> >> Avoiding gotos for the purpose of avoiding gotos is absolutely
> >> silly (as the compiler translates them to jumps, which are the
> >> same in asm) and positively harmful (for the legibility of the
> >> code; I wish I had goto in mksh???).
> > 
> > From my Commodore Basic days I still know gotos and spaghetti. I know it
> > will be translated to jumps, but I thought we are programming in C and not
> > asm, because the readability is better. But maybe I just read too much about
> > python recently ;-)
> 
> Goto in BASIC is not the same thing as goto in C. In BASIC, a goto
> statement can go all over the place. You see a goto, you don't know
> where you'll end up. Yes, that is spaghetti code.
> 
> In C, a goto can only jump within the same function. It's possible to
> overuse it, but error unwinding is one of the few cases where it's
> sensible and good to use it. Consider:
> 
> int handle = initialize_handle();
> if(connect_handle(handle)!=CONNECTION_OK) {
> 	unintialize_handle(handle);
> 	return ECONNFAILED;
> }
> if(send_greeting(handle)!=GREETING_OK) {
> 	uninitialize_handle(handle);
> 	return EGREETFAILED;
> }
> return HANDLE_OK;
> 
> This code works, and it's fairly clear what it does; but the problem
> here is that you replicate deinitialization code. If that
> deinitialization code ever needs to change, you have to change it in
> multiple places. You might miss one, causing you a leak of sorts. It's
> of course possible to nest the ifs, but that's even worse:
> 
> int handle = initialize_handle();
> int retval = HANDLE_OK;
> if(connect_handle(handle) != CONNECTION_OK) {
> 	retval = ECONNFAILED;
> } else {
> 	if(send_greeting(handle) != GREETING_OK) {
> 		retval = EGREETFAILED;
> 	}
> }
> uninitialize_handle(handle);
> return retval;
> 
> it's easy to see that this kind of code will become unreadable once
> you're past three or four of these checks. However, the compiled code
> will be *exactly* the same as the following:
> 
> int handle = initialize_handle();
> int retval = HANDLE_OK;
> if(connect_handle(handle) != CONNECTION_OK) {
> 	retval = ECONNFAILED;
> 	goto err_out;
> }
> if(send_greeting(handle) != GREETING_OK) {
> 	retval = EGREETFAILED;
> 	goto err_out;
> }
> err_out:
> uninitialize_handle(handle);
> return retval;
> 
> This is again as readable as the first example, but the deinitialization
> is grouped at the bottom of the function.

Thanks for the detailed example, do you want to teach me to be a kernel
hacker? :-)

I don't know too much C, but I have the feeling that in your last example
uninitialize_handle is called in any case, or are commands after the goto
lable skipped if you do not jump to them? If that is the case, I do not find
this more readable. I think the last lines of your example have to look like
this:

goto no_err;
err_out:
uninitialize_handle(handle);
no_err:
return retval;

And that in my exes is spaghetti... but I understand the rest of your
reasoning.

bon appetit!
Christian
