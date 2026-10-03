Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2233806B6
	for <linux-m68k@lists.linux-m68k.org>; Sat,  3 Oct 2026 05:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791005405; cv=none; b=VzgjL1oQUltkBnZYbvu21KhMXihvMqQMj1BcSltuV9ol4ZovHMAXFRLiT/hIRCjv66O2P0QNPnPol/tXR9a/yjPhia1TzTjH5LJou0ui1pe8SnLZho39v9ANAdYsFJssUN1x6r2c3JhEDQ5C6H8UKqbeI6ZGT/lR/wn6jVp11zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791005405; c=relaxed/simple;
	bh=Ghum7X5mykv/Vqq8KVmZBDIlNh49ac3eG59WlgGVhWU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GDU0bqIBj1/Mh+upYEieLqMRBAJGbuloUDVC6buhYUYvtx7IEh7wiLmO3krDfS/BBsKeSKkvvF5cUkNWupa2g+FPjKhUp508Atn+LmrLI+zK/w0SF7ffy+PL87oEojM3hqILDekDCdK9joe6tWuX62xy6yfr+cEYKEW6rofRKd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c2+27alM; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c2+27alM"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1BC907A0196;
	Sat,  3 Oct 2026 01:30:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sat, 03 Oct 2026 01:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791005401; x=1791091801; bh=8q8NC0HYa3+0dBpiUvbPBqU8gp8EWFWGj26
	S3lAx4L8=; b=c2+27alMS78V7wmCfw5sBh0YTuTGN3Mkb3gi4Jo+9Kvme0PvIo0
	DLtrOV9XerlyQQegZcctlj6um8gHqN7EMhkjuJDXUfiGLiov8t24CktqeNi1uUba
	pfkQg/JiXyn5Tmf77u9u1koxR/vDWvB7L4V9G4qsJhE5Cw6cC8k+Fw8HPPxn6vhq
	+gYSjSQfzPlR+ZO0avAART9PWLUPiTkwEixsgh12v1AWKuzi4p+qrhdEB5VGkXDd
	YhlKYQbdpQCXHGLIOq8ZO0jFo45K/ml4QKKYOlKRXQRTsIOnCEzH5mvYR8f3pfP1
	OSLL3EL5Ocl2z14XED2ApNq1JgS+/9iFHJw==
X-ME-Sender: <xms:2ZLAakBwkbGFCkjrhcDIrOS53L6gMI0wWI3bUYMPE6FoxxAdZS_1mA>
    <xme:2ZLAakVZ5hl2wPRWDm2vqWcLS3RC9KbIDY6aZu70n5XEv71vpCKU_GdARvuhD1-Iq
    SEpU2un56gahUYUK6YdBu9X4kqRHKbVncaOE3hHvrXVxIbrrGU0OfAj>
X-ME-Received: <xmr:2ZLAaiA2JcoyMpvNNokohs2nTt5e8Gg6iSpMo1Bcgvs0ljy9_Vp7omKnfJxA>
X-ME-Proxy-Cause: dmFkZTEBMGJ+IrClqC/mMWfLK0d7n+elZvbYD7ghLWGvEDFRoem9qRS3It+vQJQTTIUBki
    WWk2Wq+M2ldlxMqfcVvPy01nKNUX4xfmy2OVRIKWljRUoziwhFlyclZ9NxexQyn2FtmSrs
    z/rVXko2vfAagpMErbGOYN197oRgdEwnPJ1TtCKQCM3J083I/vJoIYSP9YD6V/J1YGFRE7
    Vesp084rJVGQVsBy12VUGKkBSsSo3pk83RM+atWUWQpqyqMzoFLViDi9zphNxTrapnR8Tq
    lKP+JU/DY46qgriwguDCmGVB4P2aqzUrsA5iEBgX1qfEwNRB1R0ntCmuk10XVsLWuPHcCj
    mb0gdYZm0NcPalshkpg8ycy3UnmdkEjjilVWOd6EbN000/WXK+NZT4xd8JLQaemZ1oIXhj
    0zY0Mnyo8HjpJmQtl677jLM+P3LWffxyI3gsI5TtS4TFcvcklAy6RJbsdZg1jQT7NUZ2d7
    raRaM4h72XDnslu2CWt35qOjhRFBXblrZ1dvHKqJu+wLHod4BkPiG5vWue7UjrsGzr80vU
    3v6ERi6GFFlY2PeqdMvJONL+aePR84w6Jq2noHENg1wKvUN5nceqcS7AjhFPWdFRk4TUk+
    e79cpaJw0Li0QG75hE9+PMke5Vs7bSMjz4F9LZ4pcG//ZC1TjBYMouX7lAZQ
X-ME-Proxy: <xmx:2ZLAan8Zj3TCXwpfLlZ2fhTcUlesUTUxpe7s3MHncRZZOML5gp4Azg>
    <xmx:2ZLAapEI1VxmkH7eAqDiCZR-cko4dGAEftGsqT59Szi7IDsmnG8oiA>
    <xmx:2ZLAalPSP6sFaNSryaHEiTveZ-SefxVvyWgTM7ztq4QcQzDWiJFzwQ>
    <xmx:2ZLAajeyucLwati2Y_ZYBR08V8P9xCd72VFG1BHxhEk4s-IxJ02IiA>
    <xmx:2ZLAaqwV2jg7XFFiqrux7Rm3QhOCVBzKQ-nZAYbZdUGwPOqQ507tJyR->
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Oct 2026 01:29:58 -0400 (EDT)
Date: Sat, 3 Oct 2026 15:30:09 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@lists.linux-m68k.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] m68k: Handle put_user faults more carefully
In-Reply-To: <CAMuHMdVbfUH1ZoFcS64t=gyE_cskMWv6gGvL8pjGirSGvAKu2w@mail.gmail.com>
Message-ID: <a62d1568-f59a-cd50-7518-12cf4ee54bd6@linux-m68k.org>
References: <88e752e0bca92c7b65533cc1b334052dd272f8ef.1790842086.git.fthain@linux-m68k.org> <02c53c37-d2ee-4c03-a8f9-0a757c3af59e@gmail.com> <CAMuHMdVbfUH1ZoFcS64t=gyE_cskMWv6gGvL8pjGirSGvAKu2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

On Fri, 2 Oct 2026, Geert Uytterhoeven wrote:

> > Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
> >
> > in case it helps.
> >
> > Anecdotally, I've seen similar uaccess faults causing kernel oops on 030
> > as well, so this may not merely be an artificial unaligned access issue.
> 
> Shouldn't this include
> https://lore.kernel.org/20240429030945.22451-3-schmitzmic@gmail.com
> ?
> 

I don't see a dependency on other patches. I think this patch stands on 
its own merits. It fixes two bugs: one is an annoyance for those of us who 
use stress-ng and the other bug is purely theoretical (thus far).

This fix can be merged independently of related bugs, even if those bugs 
have similar fixes, because separate patches are usually preferable, 
because a 'git revert' is usually a possibility.
