From: David Howells <dhowells@redhat.com>
Subject: Re: [GIT PULL] Disintegrate UAPI for m68k [ver #2]
Date: Fri, 12 Oct 2012 18:50:35 +0100
Message-ID: <11258.1350064235@warthog.procyon.org.uk>
References: <CAMuHMdXYg+GGHwpYZmVff79SU_MhX+uiLtbmY5UH+BObiHvrXw@mail.gmail.com> <21143.1349774135@warthog.procyon.org.uk>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51333 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755829Ab2JLRuk (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Fri, 12 Oct 2012 13:50:40 -0400
In-Reply-To: <CAMuHMdXYg+GGHwpYZmVff79SU_MhX+uiLtbmY5UH+BObiHvrXw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dhowells@redhat.com, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> This leaves the following empty construct:
> 
>     #ifdef CONFIG_COLDFIRE
>     #else
>     #endif

Odd.  It emitted it in both headers, which it shouldn't have.

> I'll remove it in a subsequent patch.

Thanks.

David
