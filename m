Return-Path: <SRS0=EBDC=52=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23295C2BA2B
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Apr 2020 14:54:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 007B82078E
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Apr 2020 14:54:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgDJOyf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 10 Apr 2020 10:54:35 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:53653 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgDJOye (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 10 Apr 2020 10:54:34 -0400
X-Originating-IP: 92.76.86.40
Received: from winslow.earth.sol (dslb-092-076-086-040.092.076.pools.vodafone-ip.de [92.76.86.40])
        (Authenticated sender: cts@steigies.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D70054000A;
        Fri, 10 Apr 2020 14:54:32 +0000 (UTC)
Received: from cts by winslow.earth.sol with local (Exim 4.92)
        (envelope-from <cts@winslow.earth.sol>)
        id 1jMv3A-0000i1-7W; Fri, 10 Apr 2020 16:54:32 +0200
Date:   Fri, 10 Apr 2020 16:54:32 +0200
From:   "Christian T. Steigies" <cts@debian.org>
To:     John Alexander <acontractornow@yahoo.co.uk>
Cc:     Carsten Strotmann <cas@strotmann.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Planning a Debian/Linux m68k Meeting in 2020
Message-ID: <20200410145431.GA22380@winslow.earth.sol>
Mail-Followup-To: John Alexander <acontractornow@yahoo.co.uk>,
        Carsten Strotmann <cas@strotmann.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <86wo6nwytz.fsf@emacs.strotmann.de>
 <e6625b99-0d32-3dad-d1a6-e3ea0958d8f1@physik.fu-berlin.de>
 <1802398089.6357995.1586526646576@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1802398089.6357995.1586526646576@mail.yahoo.com>
X-Info: Nach Paragraph 28 Abs. 3 Bundesdatenschutzgesetz widerspreche ich der
 Nutzung oder Uebermittlung meiner Daten fuer Werbezwecke oder fuer die
 Markt- oder Meinungsforschung.
X-No-CC: I subscribe to this list; please do not CC me on replies. 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Apr 10, 2020 at 01:50:46PM +0000, John Alexander wrote:
>  Hi there I like the idea of Jitsi as it's much more open but from the use we have had with local LUGs we  have found it to be problematic with a larger number of clients particularly 
> low bandwidth clients essentially bringing the server into a bad state. 
> 
> The sessions run on Zoom work much better.. I can gain access to both platforms to both platforms and we can try them out together and let you make up your own minds. 

Please no zoom. It's been all over the news...

We use BigBlueButton for teaching now, I had a successful meeting with more
than 180 participants (no camera, no mike for the participants). A session
with 12 parallel video streams also worked fined. The server has a 1Gbit/s
connection, I have a simple DSL connection.

In case somebody has time to waste, you can help packaging it for Debian:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=956252

Christian
