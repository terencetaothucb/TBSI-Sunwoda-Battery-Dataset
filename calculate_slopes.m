function G = calculate_slopes(matrix)
    % Number of rows
    n_rows = size(matrix, 1);
    n_cols = size(matrix, 2);
    % Preallocate an array for slopes
    G = zeros(n_rows, n_cols);

    % Calculate slope for each row (vector)
    for i = 1:n_rows
        vector = matrix(i, :);
        dy = gradient(vector);
        dx = gradient(1:length(vector));
        G(i,:) = (dy ./ dx);
    end
end
