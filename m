Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66476224D2
	for <linux-m68k@lists.linux-m68k.org>; Thu,  4 Jan 2024 14:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KrOqGj4x"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 939C3B817EA;
	Thu,  4 Jan 2024 14:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DEDC433C7;
	Thu,  4 Jan 2024 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704378077;
	bh=/ZE0ffeY3PHUJyPXXPACUFohNZu0SJq+OYpBXNqHH/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KrOqGj4xTuOzMeNcbAiBYwE2E0lu820lHOOywYIgwDtT9QOdhoZWbRhTEMMKTYl/a
	 usBOtsTftx8Bth+ONMlEP/yQPeLQIRDrEsSErvNTZyk4OGUxKKj/fhyYF6DfsaeOqm
	 FpgejHxxM7WlSqigmceQcWLvp0a4Axjx5/bTZWVU=
Date: Thu, 4 Jan 2024 15:21:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: fthain@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Subject: Re: patch "nubus: make nubus_bus_type static and constant" added to
 char-misc-testing
Message-ID: <2024010459-wrought-cartridge-d012@gregkh>
References: <2024010426-junkyard-overshot-5c16@gregkh>
 <CAMuHMdUN_AciSOrxYehoyOqYG8BFOJN2CLjY+PeqZW+ze2zf2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUN_AciSOrxYehoyOqYG8BFOJN2CLjY+PeqZW+ze2zf2g@mail.gmail.com>

On Thu, Jan 04, 2024 at 03:00:40PM +0100, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Thu, Jan 4, 2024 at 2:39 PM <gregkh@linuxfoundation.org> wrote:
> > This is a note to let you know that I've just added the patch titled
> >
> >     nubus: make nubus_bus_type static and constant
> >
> > to my char-misc git tree which can be found at
> >     git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
> > in the char-misc-testing branch.
> >
> > The patch will show up in the next release of the linux-next tree
> > (usually sometime within the next 24 hours during the week.)
> >
> > The patch will be merged to the char-misc-next branch sometime soon,
> > after it passes testing, and the merge window is open.
> >
> > If you have any questions about this process, please let me know.
> >
> >
> > From 3faea80bd9ff02b655cb0c80a1c0bdca44c0f94d Mon Sep 17 00:00:00 2001
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Date: Tue, 19 Dec 2023 16:47:41 +0100
> > Subject: nubus: make nubus_bus_type static and constant
> >
> > Now that the driver core can properly handle constant struct bus_type,
> > move the nubus_bus_type variable to be a constant structure as well,
> > placing it into read-only memory which can not be modified at runtime.
> >
> > It's also never used outside of drivers/nubus/bus.c so make it static
> > and don't export it as no one is using it.
> >
> > Cc: Finn Thain <fthain@linux-m68k.org>
> > Cc:  <linux-m68k@lists.linux-m68k.org>
> > Acked-by: Finn Thain <fthain@linux-m68k.org>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Link: https://lore.kernel.org/r/2023121940-enlarged-editor-c9a8@gregkh
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> I have already applied this to the m68k tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/commit/?h=for-v6.8&id=a15f2d48c6f84ae0dd2000288592c79d5d1acd0e
> 
> You even thanked me when I said I was going to do that:
> https://lore.kernel.org/all/2024010254-truce-populate-70d1@gregkh

Ugh, too many patches...

Thanks, I'll go drop this from my tree now.

greg k-h
