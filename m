Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569FA1B27B
	for <linux-m68k@lists.linux-m68k.org>; Wed,  3 Jan 2024 15:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yw5xUecH"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 929A8B811F6;
	Wed,  3 Jan 2024 15:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FAAC433C7;
	Wed,  3 Jan 2024 15:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704297555;
	bh=Sh1oDxxlvDmOX9fkFGqfasaagPS1FFnqillX3/n0cIk=;
	h=Date:From:To:Subject:From;
	b=yw5xUecHcahwbxaorFuC66EGHFrJd/ee/pgFfA/OwGlO7meeADcR43RFCN9SemTBe
	 tvlERHiznQUtAz87KVJtAt8wZCdMWfdegOl74YGrPzQC5846cN9MKjUXCLdLjDXvEl
	 SwNjLCUcUg4p/mNXG6ZGOkF+IfXKzLHGR04sqQ7A=
Date: Wed, 3 Jan 2024 10:59:13 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-m68k@lists.linux-m68k.org
Subject: Test delivery to the legacy address
Message-ID: <20240103-straight-intelligent-lionfish-fafe99@lemur>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

This is a test to ensure that delivery to the domain lists.linux-m68k.org is
set up properly. Please ignore.

-K
