SELECT t.*, te. *
	FROM sys.triggers t
		INNER JOIN sys.trigger_events te
	ON t.object_id = te.object_id