Return-Path: <SRS0=pOFX=5S=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB980C43331
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Apr 2020 02:09:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADA0E20719
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Apr 2020 02:09:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kc99WtLa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733311AbgDBCJx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Apr 2020 22:09:53 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38042 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733270AbgDBCJx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 1 Apr 2020 22:09:53 -0400
Received: by mail-wm1-f68.google.com with SMTP id f6so1898141wmj.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Apr 2020 19:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vex2V7U5egqEowLQvfzwIWrY5jYlwVVJlu6Yrfo90zo=;
        b=kc99WtLafuneZD+XNev1KTgPBPFXQ8QTqlByQwtAgimjlxpPYyO+w2wrW+z/e6xLDK
         2grI8oIebmAQsdMHZ5OQxhHfY7v/DaT4e9aY84jbn6EpR414Fyf8hA4PyAdf0chL84EH
         z7n4eqTciBRDhmYvJLjE8pgt78NWaj0/hRRdxmfhJP/+AEYoPhk4M/SRY+odyypSCYWI
         mxQ0yTl4iBYu65UIHplz8DCMDiBIKurkxKK5pvAHapouCwRW8DzZYKJ11G/cnuQ/Rr5M
         GfF2cUTykCkgmNQ49dlKsObEWAGsI3iVanbJLY7GeV6HvX4eqnmqhBvzSU212dMEY16k
         aF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vex2V7U5egqEowLQvfzwIWrY5jYlwVVJlu6Yrfo90zo=;
        b=d/BChD/ugAHyi/4nvV9weG8nCSgLOrTqiwYzWyDeQCduG7pL5v8YEH68TVz8rE5BHT
         Ic75LzleP5ZDmoganCaqtT8WUr0duxWyq61hjLy6NnUqw8CFeh0CZUYWnGCB1vy9U1XK
         amZ6W36h1ofxMzD5PWjGRCOkj3jX4hh7Eq8LDEv5lz94QUS3fQnBToegLNw2jGTRvhE3
         xGqmtIx85S9OBhpfWAV3/95Mas+mmMYGr4QOf1l+NLrySY09hPDWysa6u2T/fs5qEFrO
         cT58womQqPlVGaPnrFcQZUSxmYoJHybk009EWDLedWQGr4tfQjyUEXrsV+59HBF7tDEb
         4Rpw==
X-Gm-Message-State: AGi0PuY9tRGyBGvih5Hikz+gcXxjNl/bCyIXCYmxedQdeVqv5coMLsna
        /1oMyN5rW8DK2gqZP+FEPW1HZ4V7OK059qlY11A=
X-Google-Smtp-Source: APiQypKiBEdEeR/SNNjmsFK17mnw1atHhdNjkSRCA+yg8Ro+OTJz+gqQX0hxZqddI6Ja+gYYfd6unYKeME/wUG7PLMY=
X-Received: by 2002:a1c:23c8:: with SMTP id j191mr920253wmj.117.1585793390177;
 Wed, 01 Apr 2020 19:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <CABq5eXHOfryyKL9qmE15=wXW0urGnO3D58Jj0qPPbPoDsLfwkw@mail.gmail.com>
 <alpine.LNX.2.22.394.2004021007280.8@nippy.intranet>
In-Reply-To: <alpine.LNX.2.22.394.2004021007280.8@nippy.intranet>
From:   Stefan Reinauer <stefan.k.reinauer@gmail.com>
Date:   Wed, 1 Apr 2020 19:09:38 -0700
Message-ID: <CABq5eXEinp5xy2vKSAcHoE8_3esVAAwcNxBNpQDY0JkHX_DZRA@mail.gmail.com>
Subject: Re: Amiga: Writes to Zorro III cards
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Apr 1, 2020 at 4:19 PM Finn Thain <fthain@telegraphics.com.au> wrote:
>
> On Wed, 1 Apr 2020, Stefan Reinauer wrote:
>
> > When it fails/works, it fails/works consistently across several
> > rmmod/insmod cycles.
>
> That implies incomplete hardware initialization or some other bug in the
> driver initialization code.
>
> > (I see arp requests coming in on the Amiga in tcpdump, but they are
> > never answered)
>
> If packets are arriving at the interface but the kernel ignores them, it
> suggests that the packets are corrupt (e.g. invalid frame checksum).
>
> You can check for corrupted packets with a network analyzer like
> Wireshark. On a small system I would capture some traffic with 'tcpdump -i
> eth0 -s0 -w traffic.pcap' and then move the pcap file to a host
> with Wireshark installed.

Good news here (where's the brown paper bag); This fixes the network driver.

@@ -307,7 +307,7 @@ static void zz9000_eth_setup(struct net_device *dev)
        ether_setup(dev);

        dev->netdev_ops = &zz9000_netdev_ops;
-       dev->flags |= IFF_NOARP;
+       //dev->flags |= IFF_NOARP;
        dev->irq = IRQ_AMIGA_EXTER;
        memcpy(dev->dev_addr, zz9000_mac_addr, MAC_ADDR_LEN);
