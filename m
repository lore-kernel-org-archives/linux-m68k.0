From: Brad Boyer <flar@allandria.com>
Subject: Re: gcc parameter for kernel compile
Date: Sun, 10 May 2009 20:24:02 -0700
Message-ID: <20090511032402.GA20493@cynthia.pants.nu>
References: <20090511015210.GA15777@luminet.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:34268 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1753504AbZEKD7W (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 10 May 2009 23:59:22 -0400
Received: from flar by cynthia.pants.nu with local (Exim 4.63)
	(envelope-from <flar@cynthia.pants.nu>)
	id 1M3M7W-0005LR-7o
	for linux-m68k@vger.kernel.org; Sun, 10 May 2009 20:24:02 -0700
Content-Disposition: inline
In-Reply-To: <20090511015210.GA15777@luminet.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

On Sun, May 10, 2009 at 08:52:12PM -0500, Lance Tagliapietra wrote:
> When compiling my m68k linux kernel, gcc is being started with the
> following first parameters, for example:
> 
> gcc -Wp,-MD,sound/oss/dmasound/.dmasound_core.mod.o.d
> 
> and all the other objects follow the same pattern.
> 
> I am not able to locate -Wp,-MD... in the gcc documentation, any suggestions?

You need to look around at multiple places in the documentation for that
combination. The first part (-Wp) is described here (near the top):

http://gcc.gnu.org/onlinedocs/gcc-4.4.0/gcc/Preprocessor-Options.html#Preprocessor-Options

Basically, anything that is -Wp,<something> means that the "<something>"
is passed exactly as is to cpp. The -MD option to the preprocessor is
described in a later section on the same page.

The summary is that this command line is generating a dependency tree
for the file and saving it on disk for use by make.

	Brad Boyer
	flar@allandria.com

