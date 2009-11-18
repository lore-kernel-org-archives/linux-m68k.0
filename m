From: David Howells <dhowells@redhat.com>
Subject: Re: [uClinux-dev] TIF_NOTIFY_RESUME on m68k?
Date: Wed, 18 Nov 2009 23:25:35 +0000
Message-ID: <23325.1258586735@redhat.com>
References: <10f740e80911181202l6cca6b41m827f2c51f639d1f0@mail.gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54239 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752532AbZKRXZg (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 18 Nov 2009 18:25:36 -0500
In-Reply-To: <10f740e80911181202l6cca6b41m827f2c51f639d1f0@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: dhowells@redhat.com, linux-m68k <linux-m68k@vger.kernel.org>, linux-kernel@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> These commits broke CONFIG_KEYS=y on m68k, so technically the missing
> support is a regression compared to 2.6.31.

I couldn't work out how to do it.  I mentioned that it needed doing in the
logs in the hope that someone on the arch list would do it for the missing
arches.

David
