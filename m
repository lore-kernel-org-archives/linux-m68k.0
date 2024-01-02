Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D631C287
	for <linux-m68k@lists.linux-m68k.org>; Wed,  3 Jan 2024 16:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MRV2LplK"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8B23DB80B88;
	Tue,  2 Jan 2024 13:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD25C433C7;
	Tue,  2 Jan 2024 13:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704202501;
	bh=Ibk8sEOGH1gE85+6yGGE3w/Leiem7H6nu9lxyv2HE+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MRV2LplKk9Axo7cZAsrgqjdS5INN7OyvKVF+P6opgkLnRNhjExily3q1EQ09tnbxG
	 M2GumwlVoWifzu85wr8fz5KYgDwApkbzr3XYaLIDFRah1AzsbYbXQa4fv+9t7FI+V9
	 gBLW5gHgd4xjJuoXJBMNNpXPR7cokY0L3xxTS8q8=
Date: Tue, 2 Jan 2024 14:34:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: fthain@linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH] nubus: make nubus_bus_type static and constant
Message-ID: <2024010254-truce-populate-70d1@gregkh>
References: <2023121940-enlarged-editor-c9a8@gregkh>
 <CAMuHMdWHnfwcdXrD6JrcdfxEop1oeMyN3hrvf+iEJQi-xM7pmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWHnfwcdXrD6JrcdfxEop1oeMyN3hrvf+iEJQi-xM7pmw@mail.gmail.com>

On Tue, Jan 02, 2024 at 09:16:23AM +0100, Geert Uytterhoeven wrote:
> On Tue, Dec 19, 2023 at 4:48 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > Now that the driver core can properly handle constant struct bus_type,
> > move the nubus_bus_type variable to be a constant structure as well,
> > placing it into read-only memory which can not be modified at runtime.
> >
> > It's also never used outside of drivers/nubus/bus.c so make it static
> > and don't export it as no one is using it.
> >
> > Cc: Finn Thain <fthain@linux-m68k.org>
> > Cc: linux-m68k@lists.linux-m68k.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> i.e. will queue in the m68k for-v6.8 branch.

Thanks!
